import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const Center(
        child: Text("Hello World!"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 35,), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.add, size: 35,), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 35,), label: "", ),
          ]),
    );
  }
}