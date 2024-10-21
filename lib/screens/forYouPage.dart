import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForYouScreen extends StatefulWidget{
  const ForYouScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ForYouScreenState();
  }
}

class _ForYouScreenState extends State<ForYouScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("For You BonApp"),
      ),
      body: const Center(
        child: Text("Work in progress"),
      ),
    );
  }
}