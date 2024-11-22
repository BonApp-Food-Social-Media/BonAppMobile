import 'package:bon_app_mobile/models/food_model.dart';

class User{
  const User({
    required this.username,
    required this.email,
    required this.password,
    required this.favoredMeals,
    required this.profilePicURL,
    required this.followingUsername,
    required this.followersUsername,
    required this.likedMeals,
    required this.swipedMeals,
});

  final String username;
  final String email;
  final String password;
  final List<FoodModel> favoredMeals;
  final String profilePicURL;
  final List<String> followingUsername;
  final List<String> followersUsername;
  final List<FoodModel> likedMeals;
  final List<FoodModel> swipedMeals;
}