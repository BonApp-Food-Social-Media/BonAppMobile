import 'package:bon_app_mobile/enum/time.dart';

import '../enum/filters.dart';

class FoodModel {
  const FoodModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.time,
    required this.ingredients,
    required this.steps,
    required this.username,
    required this.filters,
  });

  final int id;
  final String name;
  final String imagePath;
  final Time time;
  final String ingredients;
  final String steps;
  final String username;
  final List<Filters> filters;
}
