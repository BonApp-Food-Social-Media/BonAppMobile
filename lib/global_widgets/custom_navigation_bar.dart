import 'package:bon_app_mobile/singleton/active_user_singleton.dart';
import 'package:flutter/material.dart';

import 'package:bon_app_mobile/models/user_model.dart';
import 'package:bon_app_mobile/screens/favorites/favorites.dart';
import 'package:bon_app_mobile/screens/main/home_page.dart';
import 'package:bon_app_mobile/screens/new_meals/new_meal.dart';
import 'package:bon_app_mobile/screens/personal_profile/profile.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.initialIndexOfScreen});

  final int? initialIndexOfScreen;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int? _currentIndex;
  bool isHome = false;
  bool isNewMeal = false;
  bool isFavorite = false;
  bool isProfile = false;
  User? activeUser = ActiveUserSingleton().activeUser;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndexOfScreen;

    switch (_currentIndex) {
      case 0:
        isHome = true;
        break;
      case 1:
        isNewMeal = true;
        break;
      case 2:
        isFavorite = true;
        break;
      case 3:
        isProfile = true;
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const NewMealScreen(),
        ),
      );
    } else {
      Widget screen;

      switch (index) {
        case 0:
          screen = const HomePageScreen();
          break;
        case 2:
          screen = const FavoritesScreen();
          break;
        case 3:
          screen = ProfileScreen(
            user: activeUser!,
            isPersonalProfile: true,
            showBackButton: false,
          );
          break;
        default:
          return;
      }

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: const Color(0xFFf3f3e0),
      currentIndex: _currentIndex!,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(size: 35),
      unselectedIconTheme: const IconThemeData(size: 35),
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            isHome ? Icons.home : Icons.home_outlined,
            color: Colors.black,
          ),
          label: "Go to FoodCourt",
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.add_box_outlined,
            color: Colors.black,
          ),
          label: "Create a dream Recipe",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            isFavorite ? Icons.bookmark : Icons.bookmark_outline,
            color: Colors.black,
          ),
          label: "Go to your favorite Food",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            isProfile ? Icons.account_circle : Icons.account_circle_outlined,
            color: Colors.black,
          ),
          label: "Go to your Account",
        ),
      ],
    );
  }
}