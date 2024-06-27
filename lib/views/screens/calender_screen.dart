import 'package:flutter/material.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("calender screen app bar"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("search screen"),
      ),
    );
  }
}
