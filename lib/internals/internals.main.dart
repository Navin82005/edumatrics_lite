import 'package:edumatrics_lite/internals/internals.marks.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternalView extends StatefulWidget {
  const InternalView({super.key});

  @override
  State<InternalView> createState() => _InternalViewState();
}

class _InternalViewState extends State<InternalView> {
  late int sem = 0;
  late int currentSem = 0;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String temp = prefs.getString("academicYear")!;
      currentSem = int.parse(prefs.getString("currentSem")!);
      sem = int.parse(temp.split(" - ")[1]) - DateTime.now().year - currentSem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Internal",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: ListView(
          children: renderSemTiles(),
        ),
      ),
    );
  }

  renderSemTiles() {
    List<Padding> tiles = [];
    for (int i = 0; i < currentSem; i++) {
      if (i + 1 != currentSem) {
        tiles.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                print(i);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        SemesterMarksView(semIndex: i),
                  ),
                );
              },
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                "Sem ${i + 1}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              tileColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
        );
      } else {
        tiles.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                print(i);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        SemesterMarksView(semIndex: i),
                  ),
                );
              },
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                "Sem ${i + 1}",
                style: TextStyle(
                  fontFamily: "poppins",
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              trailing: Text(
                "Current Semester",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: "poppins",
                ),
              ),
              tileColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
        );
      }
    }
    return tiles;
  }
}
