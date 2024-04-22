import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const DrawerTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontFamily: "Poppins",
          ),
        ),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
