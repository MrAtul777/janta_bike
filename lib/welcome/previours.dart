import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PreviousButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text("Previous", style: TextStyle(color: Colors.indigo.shade900)),
    );
  }
}
