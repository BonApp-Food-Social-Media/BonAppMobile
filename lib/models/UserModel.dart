import 'package:bon_app_mobile/models/FoodModel.dart';

class User{
  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.likedMeals,
    required this.profilePicURL,
    required this.followingUsername,
    required this.followersUsername,
});

  final int id;
  final String username;
  final String email;
  final String password;
  final List<FoodModel> likedMeals;
  final String profilePicURL;
  final List<String> followingUsername;
  final List<String> followersUsername;
}