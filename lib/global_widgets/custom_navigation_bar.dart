import 'package:flutter/material.dart';

import '../screens/favorites/favorites.dart';
import '../screens/main/home_page.dart';
import '../screens/new_meals/new_meal.dart';
import '../screens/profile/profile.dart';

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
      case 3:
        isProfile = true;
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePageScreen(),
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NewMealScreen(),
          ),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FavoritesScreen(),
          ),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
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
        BottomNavigationBarItem(
          icon: Icon(
            isNewMeal ? Icons.add_box : Icons.add_box_outlined,
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
