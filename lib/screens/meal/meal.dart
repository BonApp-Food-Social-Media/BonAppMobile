/*import 'package:bon_app_mobile/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../favorites/favorites.dart';
import '../main/home_page.dart';
import '../newMeals/new_meal.dart';
import '../profile/profile.dart';

class MealScreen extends StatefulWidget{
  MealScreen({super.key, required this.activeUser});

  User activeUser;
}

class MealScreenState extends State<MealScreen>{
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePageScreen(
                activeUser: widget.activeUser,
              ),
            ),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NewMealScreen(
                activeUser: widget.activeUser,
              ),
            ),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesScreen(
                activeUser: widget.activeUser,
              ),
            ),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(activeUser: widget.activeUser),
            ),
          );
          break;
      }
    }


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Currently implementing"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(size: 35),
        unselectedIconTheme: const IconThemeData(size: 35),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            label: "Go to FoodCourt",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
            label: "Create a dream Recipe",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_outline,
              color: Colors.black,
            ),
            label: "Go to your favorite Food",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
            label: "Go to your Account",
          ),
        ],
      ),
    );
  }
}*/