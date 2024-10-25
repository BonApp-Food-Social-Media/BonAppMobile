import 'package:bon_app_mobile/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import '../../data/userData.dart';
import '../main/homePage.dart';

class NewMealScreen extends StatefulWidget {
  const NewMealScreen({super.key});

  @override
  _NewMealScreenState createState() => _NewMealScreenState();
}

class _NewMealScreenState extends State<NewMealScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePageScreen()),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Add a meal"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
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
