import 'dart:io';

import 'package:bon_app_mobile/models/food_model.dart';
import 'package:flutter/material.dart';

class FullWidthMeal extends StatelessWidget {
  const FullWidthMeal({super.key, required this.meal});

  final FoodModel meal;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<String> splitIngredients(String ingredients) {
      final RegExp regExp = RegExp(r'[|,\n/]+');
      List<String> rawSplit = ingredients.split(regExp);
      return rawSplit
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList();
    }

    List<String> splitSteps(String steps) {
      final RegExp regExp = RegExp(r'[|\n,\/]+');
      final RegExp numberingRegExp = RegExp(r'^\d+[\.\)]\s*');
      return steps
          .split(regExp)
          .map((step) => step.replaceAll(numberingRegExp, '').trim())
          .where((step) => step.isNotEmpty)
          .toList();
    }


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                )),
            Text(
              meal.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              meal.time.name,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(meal.imagePath),
                  fit: BoxFit.cover,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.6,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/no_image_found.png",
                      fit: BoxFit.cover,
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.3,
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.05,),
              const Text(
                "Created by:",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                meal.username,
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Text(
                "Ingredients",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              for (var ingredient in splitIngredients(meal.ingredients))
                Text(
                  "- $ingredient",
                  style: const TextStyle(fontSize: 20),
                ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Text(
                "Recipe Steps",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              for (var i = 0; i < splitSteps(meal.steps).length; i++)
                Text("${i + 1}. ${splitSteps(meal.steps)[i].trim()}",
                    style: const TextStyle(fontSize: 20)),
              SizedBox(
                height: screenHeight * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
