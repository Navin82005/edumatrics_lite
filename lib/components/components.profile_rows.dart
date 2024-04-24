import 'package:flutter/material.dart';

class CustomProfileRow extends StatelessWidget {
  final String text;
  final String label;
  const CustomProfileRow({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 15,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        const Spacer(),
        Text(
          text.toUpperCase(),
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 15,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }
}
