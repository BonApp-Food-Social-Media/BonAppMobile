import 'package:bon_app_mobile/global_widgets/custom_navigation_bar.dart';
import 'package:bon_app_mobile/global_widgets/meal_list_profile_favorite.dart';
import 'package:bon_app_mobile/models/food_model.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../singleton/active_user_singleton.dart';
import '../../singleton/food_list_singleton.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FavoritesScreenState();
  }
}

class FavoritesScreenState extends State<FavoritesScreen> {
  User? activeUser = ActiveUserSingleton().activeUser;
  List<FoodModel>? meals = FoodListSingleton().foodsList;
  List<FoodModel> mealsFavored = [];

  @override
  void initState() {
    super.initState();
    mealsFavored = meals!.where((food) => activeUser!.favoredMeals.contains(food.id)).toList();
  }

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
      body: Center(
        child: activeUser!.favoredMeals.isEmpty
            ? const Text("No Favored Meals!")
            : SingleChildScrollView(
                child: MealListProfileFavorite(foodList: mealsFavored),
              ),
      ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: 2),
    );
  }
}
