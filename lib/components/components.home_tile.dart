import 'package:flutter/material.dart';

class CustomHomeTile extends StatelessWidget {
  final String content;
  final Function()? onTap;

  const CustomHomeTile({super.key, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 20,
      contentPadding:
          const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 10),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        content,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontFamily: "Poppins",
          fontSize: 25,
        ),
      ),
      trailing: Icon(
        Icons.navigate_next,
        size: 25,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
