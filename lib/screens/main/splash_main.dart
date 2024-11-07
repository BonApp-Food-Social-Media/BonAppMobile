import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  //TODO Implement Splash Screen as soon as backend is intact

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BonApp"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("Successfully logged in!"),
            CircularProgressIndicator(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
