import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMealScreen extends StatelessWidget{
  const NewMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a meal"),
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