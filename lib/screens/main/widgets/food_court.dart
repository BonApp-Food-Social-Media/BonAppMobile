import 'package:flutter/material.dart';

import 'package:bon_app_mobile/models/food_model.dart';
import 'package:bon_app_mobile/models/user_model.dart';
import 'package:bon_app_mobile/singleton/active_user_singleton.dart';
import 'package:bon_app_mobile/singleton/food_list_singleton.dart';
import 'meal_main.dart';

class FoodCourtScreen extends StatefulWidget {
  const FoodCourtScreen({
    super.key,
    required this.isFoodCourt,
  });

  final bool isFoodCourt;

  @override
  State<FoodCourtScreen> createState() => _FoodCourtScreenState();
}

class _FoodCourtScreenState extends State<FoodCourtScreen> {
  List<FoodModel>? meals = FoodListSingleton().foodsList;


  @override
  Widget build(BuildContext context) {
    User? activeUser = ActiveUserSingleton().activeUser;

    final foodCourtFood = meals != null
        ? meals!
            .where((food) =>
                food.username != activeUser!.username &&
                !activeUser.swipedMeals.contains(food.id))
            .toList()
        : [];

    final followingFood = meals != null
        ? meals!
            .where((food) =>
                food.username != activeUser!.username &&
                !activeUser.swipedMeals.contains(food.id) &&
                activeUser.followingUsername.contains(food.username))
            .toList()
        : [];

    onDismissed(FoodModel food) {
      setState(() {
        widget.isFoodCourt
            ? foodCourtFood.remove(food)
            : followingFood.remove(food);
      });
    }

    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  "You reached the end 😲. There are strangely no new meal ideas. \nPlease try again later...",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          if (widget.isFoodCourt)
            for (var food in foodCourtFood)
              MealMainPage(
                foodModel: food,
                onDismissed: (direction) {
                  onDismissed(food);
                },
                isFoodCourt: widget.isFoodCourt,
              )
          else
            for (var food in followingFood)
              MealMainPage(
                foodModel: food,
                onDismissed: (direction) {
                  onDismissed(food);
                },
                isFoodCourt: widget.isFoodCourt,
              ),
        ],
      ),
    );
  }
}
