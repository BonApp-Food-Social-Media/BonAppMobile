import 'dart:io';

import 'package:bon_app_mobile/data/user_data.dart';
import 'package:bon_app_mobile/models/food_model.dart';
import 'package:bon_app_mobile/models/user_model.dart';
import 'package:bon_app_mobile/screens/full_width_meal/full_width_meal.dart';
import 'package:bon_app_mobile/screens/main/widgets/icon_row_foodcourt.dart';
import 'package:bon_app_mobile/singleton/active_user_singleton.dart';
import 'package:flutter/material.dart';
import 'package:bon_app_mobile/screens/personal_profile/profile.dart';

class MealMainPage extends StatefulWidget {
  const MealMainPage({
    super.key,
    required this.foodModel,
    required this.onDismissed,
    required this.isFoodCourt,
  });

  final FoodModel foodModel;
  final Function(DismissDirection) onDismissed;
  final bool isFoodCourt;

  @override
  State<StatefulWidget> createState() {
    return _MealMainPageState();
  }
}

class _MealMainPageState extends State<MealMainPage> {
  User? activeUser = ActiveUserSingleton().activeUser;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Dismissible(
        key: ObjectKey(widget.foodModel),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          activeUser?.swipedMeals.add(widget.foodModel.id);
          widget.onDismissed(direction);
        },
        background: Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
        ),
        secondaryBackground: Container(
          color: Colors.white,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      User userToShow = userData.where((user) => user.username == widget.foodModel.username).first;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            user: userToShow,
                            isPersonalProfile: false,
                            showBackButton: true,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      widget.foodModel.username,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  activeUser!.followingUsername.contains(widget.foodModel.username)
                      ? OutlinedButton(
                          onPressed: () {
                            setState(() {
                              activeUser!.followingUsername.remove(widget.foodModel.username);
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Subscribed",
                            style: TextStyle(fontSize: 15, color: Color(0xFF123456)),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              activeUser!.followingUsername.add(widget.foodModel.username);
                            });
                          },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF123456),
                    ),
                          child: const Text(
                            "Subscribe",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        )
                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullWidthMeal(meal: widget.foodModel),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(widget.foodModel.imagePath),
                  fit: BoxFit.cover,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.5,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/no_image_found.png",
                      fit: BoxFit.cover,
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.5,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.foodModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const SizedBox(height: 20),
            IconRowFoodCourt(foodModel: widget.foodModel),
          ],
        ),
      ),
    );
  }
}
