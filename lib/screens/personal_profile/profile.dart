import 'package:bon_app_mobile/global_widgets/meal_list_profile_favorite.dart';
import 'package:bon_app_mobile/screens/personal_profile/settings.dart';
import 'package:flutter/material.dart';
import '../../global_widgets/custom_navigation_bar.dart';
import '../../models/food_model.dart';
import '../../models/user_model.dart';
import '../../singleton/food_list_singleton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});

  final User user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<FoodModel> _mealsMade = [];
  List<FoodModel>? meals = FoodListSingleton().foodsList;

  @override
  void initState() {
    super.initState();
    _mealsMade =
        meals!.where((meal) => meal.username == widget.user.username).toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Your Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              widget.user.username,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${_mealsMade.length} Meals",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${widget.user.followersUsername.length} Followers",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${widget.user.followingUsername.length} Following",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            _mealsMade.isNotEmpty
                ? MealListProfileFavorite(foodList: _mealsMade)
                : const Center(
                    child: Text(
                      "You have not posted a meal yet...",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: 3),
    );
  }
}
//TODO implement