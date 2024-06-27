import 'package:flutter/material.dart';

class NotificationSceen extends StatelessWidget {
  const NotificationSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("library screen app bar"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("library screen"),
      ),
    );
  }
}
