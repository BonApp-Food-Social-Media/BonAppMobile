import 'package:flutter/material.dart';

import '../data/food_data.dart';
import '../models/food_model.dart';
import '../models/user_model.dart';
import '../singleton/active_user_singleton.dart';
import 'meal_favorite_profile.dart';

class ProfileTabView extends StatefulWidget {
  @override
  _ProfileTabViewState createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView>
    with SingleTickerProviderStateMixin {

  List<FoodModel> _mealsMade = [];
  List<FoodModel> _mealsLiked = [];
  User? activeUser = ActiveUserSingleton().activeUser;

  @override
  void initState() {
    super.initState();
    _mealsMade = foodsFoodCourtData
        .where((meal) => meal.username == activeUser!.username)
        .toList();
    _mealsMade += foodsFollowingData
        .where((meal) => meal.username == activeUser!.username)
        .toList();
    _mealsLiked = activeUser!.likedMeals;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Center(child: Text("Your Meals")),
              Center(child: Text("Liked Meals")),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Your Meals Tab
                _mealsMade.isNotEmpty
                    ? GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: _mealsMade.length,
                  itemBuilder: (context, index) {
                    return MealFavoriteAndProfile(foodModel: _mealsMade[index]);
                  },
                )
                    : const Center(
                  child: Text(
                    "There are no meals found.",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Liked Meals Tab
                _mealsLiked.isNotEmpty
                    ? GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: _mealsLiked.length,
                  itemBuilder: (context, index) {
                    return MealFavoriteAndProfile(foodModel: _mealsLiked[index]);
                  },
                )
                    : const Center(
                  child: Text(
                    "There are no liked meals found.",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
