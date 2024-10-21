import 'package:bon_app_mobile/screens/forYouPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ForYouScreen(),
    );
  }
}