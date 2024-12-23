import 'package:bon_app_mobile/global_widgets/custom_navigation_bar.dart';
import 'package:bon_app_mobile/models/user_model.dart';
import 'package:bon_app_mobile/singleton/food_list_singleton.dart';
import 'package:flutter/material.dart';
import 'package:bon_app_mobile/singleton/active_user_singleton.dart';

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
                ActiveUserSingleton().clearUser();
                FoodListSingleton().clearFoodList();
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
        child: Text("Settings"),
      ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: 3),
    );
  }
}
