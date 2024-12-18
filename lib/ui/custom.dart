import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor; // Allow customization of background color
  final double elevation; // Custom elevation
  final EdgeInsetsGeometry padding; // Custom padding

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.elevation = 5.0,
    this.padding =
    const EdgeInsets.symmetric(vertical: 16.0), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ??
            Colors.indigo
                .shade900, // Use provided color or default to indigo.shade900
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        elevation: elevation, // Adds shadow
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
