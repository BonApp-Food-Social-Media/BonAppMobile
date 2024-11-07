import 'package:bon_app_mobile/global_widgets/custom_navigation_bar.dart';
import 'package:bon_app_mobile/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../main/home_page.dart';
import '../new_meals/new_meal.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FavoritesScreenState();
  }
}

class FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Favorites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text("Currently implementing"),
      ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: 2),
    );
  }
}
