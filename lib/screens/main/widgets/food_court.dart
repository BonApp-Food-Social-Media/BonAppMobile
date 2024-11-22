import 'package:flutter/cupertino.dart';

import '../../../models/food_model.dart';
import '../../../models/user_model.dart';
import '../../../singleton/active_user_singleton.dart';
import 'meal_main.dart';

class FoodCourtScreen extends StatelessWidget {
  const FoodCourtScreen({
    super.key,
    required this.foods,
    required this.isFoodCourt,
    required this.onDismissed,
  });

  final List<FoodModel> foods;
  final bool isFoodCourt;
  final void Function(DismissDirection, FoodModel) onDismissed;

  @override
  Widget build(BuildContext context) {
    User? activeUser = ActiveUserSingleton().activeUser;

    final filteredFoods = foods.where((food) => food.username != activeUser!.username && !activeUser.swipedMeals.contains(food)).toList();

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
          for (var food in filteredFoods)
            MealMainPage(
              foodModel: food,
              onDismissed: (direction) {
                onDismissed(direction, food);
              },
              isFoodCourt: isFoodCourt,
            ),
        ],
      ),
    );
  }
}
