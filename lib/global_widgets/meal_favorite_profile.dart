import 'dart:io';

import 'package:bon_app_mobile/models/food_model.dart';
import 'package:flutter/material.dart';

class MealFavoriteAndProfile extends StatelessWidget {
  const MealFavoriteAndProfile({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: FadeInImage(
        placeholder:
            const AssetImage("assets/images/placeholder_or_error_image.jpg"),
        image: NetworkImage(
          foodModel.imageURL,
        ),
        fit: BoxFit.cover,
        width: screenWidth * 0.33,
        height: screenHeight * 0.2,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/images/no_image_found.png",
            fit: BoxFit.cover,
            width: screenWidth * 0.33,
            height: screenHeight * 0.2,
          );
        },
      ),
    );
  }
}
