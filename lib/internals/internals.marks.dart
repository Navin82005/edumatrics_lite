import 'package:edumatrics_lite/actions/actions.internals.dart';
import 'package:edumatrics_lite/internals/internals.single.dart';
import 'package:flutter/material.dart';

class SemesterMarksView extends StatefulWidget {
  final int semIndex;
  const SemesterMarksView({super.key, required this.semIndex});

  @override
  State<SemesterMarksView> createState() => _SemesterMarksViewState();
}

class _SemesterMarksViewState extends State<SemesterMarksView> {
  bool error = false;

  late Map data = {
    "1": {
      "attendance": 90,
      "subjects": {"PQT": 90, "ADB": 90, "AJP": 90, "DAA": 90, "IP": 90}
    },
    "2": {
      "attendance": 90,
      "subjects": {"PQT": 90, "ADB": 90, "AJP": 90, "DAA": 90, "IP": 90}
    },
    "3": {
      "attendance": 90,
      "subjects": {"PQT": 90, "ADB": 90, "AJP": 90, "DAA": 90, "IP": 90}
    }
  };
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final response = await getInternalMarks(widget.semIndex + 1);
    print("internals.marks $response");
    if (response.containsKey("status")) {
      if (response["status"] == "Failed") {
        setState(() {
          error = true;
        });
      } else {
        setState(() {
          error = true;
        });
      }
    } else {
      setState(() {
        error = false;
        data = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internal | Semester ${widget.semIndex + 1}"),
      ),
      body: error
          ? const Text("Error connecting Server")
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              children: RenderMarksView(),
            ),
    );
  }

  RenderMarksView() {
    List<Padding> tiles = [];

    for (String iat in data.keys) {
      tiles.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              print(data[iat]);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SingleMarkView(
                    iat: int.parse(iat),
                    result: data[iat],
                  ),
                ),
              );
            },
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            iconColor: Theme.of(context).colorScheme.inversePrimary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              "Internal Assessment $iat",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            tileColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      );
    }

    return tiles;
  }
}
