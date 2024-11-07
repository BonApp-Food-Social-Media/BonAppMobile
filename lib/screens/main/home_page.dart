import 'package:bon_app_mobile/data/food_data.dart';
import 'package:bon_app_mobile/global_widgets/custom_navigation_bar.dart';
import 'package:bon_app_mobile/screens/main/food_court.dart';
import 'package:flutter/material.dart';

import '../../models/food_model.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<FoodModel> _foodsFoodCourt = [];
  List<FoodModel> _foodsFollowing = [];
  final List<FoodModel> _swipedFoodsRight = [];
  var _isFoodCourt = true;

  @override
  void initState() {
    super.initState();
    _foodsFoodCourt = List.from(foodsFoodCourtData);
    _foodsFollowing = List.from(foodsFollowingData);
  }

  onDismissed(DismissDirection direction, FoodModel food) {
    setState(() {
      if (direction == DismissDirection.startToEnd) {
        _swipedFoodsRight.add(food);
      }
      _isFoodCourt
          ? _foodsFoodCourt.remove(food)
          : _foodsFollowing.remove(food);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => setState(() => _isFoodCourt = false),
              child: Text(
                "Following",
                style: TextStyle(
                  color: _isFoodCourt ? Colors.black : Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () => setState(() => _isFoodCourt = true),
              child: Text(
                "Food Court",
                style: TextStyle(
                  color: _isFoodCourt ? Colors.blue : Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _isFoodCourt
          ? FoodCourtScreen(
              foods: _foodsFoodCourt,
              isFoodCourt: true,
              onDismissed: onDismissed,
            )
          : FoodCourtScreen(
              foods: _foodsFollowing,
              isFoodCourt: false,
              onDismissed: onDismissed,
            ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: 0),
    );
  }
}
