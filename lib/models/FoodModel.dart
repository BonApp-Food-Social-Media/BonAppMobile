import 'dart:ui';

import 'UserModel.dart';

class FoodModel {
  const FoodModel(
      {required this.id,
      required this.name,
      required this.imageURL,
      required this.minutes,
      required this.ingredients,
      required this.steps,
      required this.user});

  final int id;
  final String name;
  final String imageURL;
  final int minutes;
  final List<String> ingredients;
  final List<String> steps;
  final User user;
}
