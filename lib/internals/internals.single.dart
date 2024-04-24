import 'package:flutter/material.dart';

class SingleMarkView extends StatelessWidget {
  final int iat;
  final Map result;
  const SingleMarkView({super.key, required this.iat, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internals | Assessment $iat"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(),
          ),
          ListView(
            children: RenderMarks(context),
          ),
        ],
      ),
    );
  }

  RenderMarks(BuildContext context) {
    List<Padding> tiles = [];

    print("result $result");

    for (String subject in result["subjects"].keys) {
      tiles.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              print(result["subjects"][subject]);
            },
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            iconColor: Theme.of(context).colorScheme.inversePrimary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              "$subject - ${result["subjects"][subject]}",
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
