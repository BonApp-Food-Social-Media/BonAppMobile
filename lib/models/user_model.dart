import 'package:bon_app_mobile/models/food_model.dart';

class User{
  const User({
    required this.username,
    required this.email,
    required this.password,
    required this.likedMeals,
    required this.profilePicURL,
    required this.followingUsername,
    required this.followersUsername,
});

  final String username;
  final String email;
  final String password;
  final List<FoodModel> likedMeals;
  final String profilePicURL;
  final List<String> followingUsername;
  final List<String> followersUsername;
}