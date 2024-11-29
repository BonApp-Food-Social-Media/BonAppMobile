import 'package:bon_app_mobile/models/food_model.dart';
import 'package:flutter/material.dart';

import 'meal_favorite_profile.dart';

class MealListProfileFavorite extends StatelessWidget {
  const MealListProfileFavorite({super.key, required this.foodList});

  final List<FoodModel> foodList;

  @override
  Widget build(BuildContext context) {
    List<FoodModel> reversedList = foodList.reversed.toList();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemCount: reversedList.length,
        itemBuilder: (context, index) {
          return MealFavoriteAndProfile(foodModel: reversedList[index]);
        },
      ),
    );
  }
}
