import 'dart:io';

import 'package:bon_app_mobile/models/food_model.dart';
import 'package:flutter/material.dart';

import '../screens/full_width_meal/full_width_meal.dart';

class MealFavoriteAndProfile extends StatelessWidget {
  const MealFavoriteAndProfile({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullWidthMeal(meal: foodModel),
          ),
        );
      },
      child: Center(
        child: foodModel.imagePath.isNotEmpty
            ? Image.file(
                File(foodModel.imagePath),
                fit: BoxFit.cover,
                width: screenWidth * 0.33,
                height: screenHeight * 0.2,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/no_image_found.png",
                    fit: BoxFit.cover,
                    width: screenWidth * 0.33,
                    height: screenHeight * 0.2,
                  );
                },
              )
            : Image.asset(
                "assets/images/placeholder_or_error_image.jpg",
                fit: BoxFit.cover,
                width: screenWidth * 0.33,
                height: screenHeight * 0.2,
              ),
      ),
    );
  }
}
