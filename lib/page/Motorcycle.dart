import 'package:flutter/material.dart';

class Motorcycle extends StatefulWidget {
  const Motorcycle({super.key});

  @override
  State<Motorcycle> createState() => _MotorcycleState();
}

class _MotorcycleState extends State<Motorcycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('new page'),
    );
  }
}
