import 'package:bon_app_mobile/data/foodData.dart';
import 'package:bon_app_mobile/screens/main/foodCourt.dart';
import 'package:bon_app_mobile/screens/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../data/userData.dart';
import '../../models/FoodModel.dart';
import '../newMeals/newMeal.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
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
      _isFoodCourt ? _foodsFoodCourt.remove(food) : _foodsFollowing.remove(food);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NewMealScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen(user: dummyUser,)),
        );
        break;
    }
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
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, size: 35),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 35),
            label: "",
          ),
        ],
      ),
    );
  }
}
