class FoodModel {
  const FoodModel({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.minutes,
    required this.ingredients,
    required this.steps,
    required this.username,
    required this.filters,
  });

  final int id;
  final String name;
  final String imageURL;
  final int minutes;
  final String ingredients;
  final String steps;
  final String username;
  final List<String> filters;
}
