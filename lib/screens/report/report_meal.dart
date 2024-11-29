import 'package:bon_app_mobile/models/food_model.dart';
import 'package:flutter/material.dart';

class ReportMeal extends StatelessWidget {
  const ReportMeal({super.key, required this.meal});

  final FoodModel meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
            const Text(
              "Report Meal",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Reporting ${meal.name}"),
      ),
    );
  }
}
