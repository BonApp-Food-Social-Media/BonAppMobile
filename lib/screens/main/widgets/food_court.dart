import 'package:flutter/cupertino.dart';

import '../../../models/food_model.dart';
import '../../../models/user_model.dart';
import '../../../singleton/active_user_singleton.dart';
import '../../../singleton/food_list_singleton.dart';
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
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  "You reached the end 😲. There are strangely no new meal ideas. \nTry again later and don't tell anyone about the easter egg",
                  style: TextStyle(fontSize: 30),
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
