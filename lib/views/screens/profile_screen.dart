import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("profile screen app bar"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("profile screen"),
      ),
    );
  }
}
