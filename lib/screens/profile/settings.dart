import 'package:bon_app_mobile/global_widgets/custom_navigation_bar.dart';
import 'package:bon_app_mobile/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../singleton/active_user_singleton.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    User? activeUser = ActiveUserSingleton().activeUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Currently implementing"),
      ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: null), //Index 4 because it doesn't need to be in the Navigation bar
    );
  }
}
