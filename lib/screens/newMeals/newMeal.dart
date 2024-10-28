import 'dart:io';

import 'package:bon_app_mobile/screens/favorites/favorites.dart';
import 'package:bon_app_mobile/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import '../../data/userData.dart';
import '../../enum/filters.dart';
import '../../enum/time.dart';
import '../main/homePage.dart';
import '../../widgets/UserImagePicker.dart'; // Import UserImagePicker widget

class NewMealScreen extends StatefulWidget {
  const NewMealScreen({super.key});

  @override
  _NewMealScreenState createState() => _NewMealScreenState();
}

class _NewMealScreenState extends State<NewMealScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerTime = TextEditingController();
  final TextEditingController _controllerFilters = TextEditingController();
  final TextEditingController _controllerIngredients = TextEditingController();
  final TextEditingController _controllerReceipt = TextEditingController();
  int _selectedIndex = 1;
  File? _selectedImage;

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
          MaterialPageRoute(builder: (context) => const FavoritesScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ProfileScreen(
                user: dummyUser,
              )),
        );
        break;
    }
  }

  void _pickImage(File pickedImage) {
    setState(() {
      _selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Add a meal"),
      ),
      body: Column(
        children: [
          UserImagePicker(
            onPickImage: (pickedImage) {
              _selectedImage = pickedImage;
            }, // Pass _pickImage callback
          ),
          if (_selectedImage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                _selectedImage!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          TextField(
            controller: _controllerName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name of the meal',
            ),
          ),
          DropdownMenu<Filters>(
            controller: _controllerFilters,
            requestFocusOnTap: true,
            label: const Text('Filter'),
            dropdownMenuEntries: Filters.values
                .map<DropdownMenuEntry<Filters>>(
                    (Filters filter) {
                  return DropdownMenuEntry<Filters>(
                    value: filter,
                    label: filter.name,
                  );
                }).toList(),
          ),
          DropdownMenu<Time>(
            controller: _controllerTime,
            requestFocusOnTap: true,
            label: const Text('Time'),
            dropdownMenuEntries: Time.values
                .map<DropdownMenuEntry<Time>>(
                    (Time time) {
                  return DropdownMenuEntry<Time>(
                    value: time,
                    label: time.name,
                  );
                }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
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
              Icons.add_box,
              color: Colors.black,
            ),
            label: "Create a dream Recipe",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
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
}
