import 'dart:io';

import 'package:bon_app_mobile/global_widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../enum/filters.dart';
import '../../enum/time.dart';
import '../../global_widgets/user_image_picker.dart';

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
  File? _selectedImage;

  /*void _pickImage(File pickedImage) {
    setState(() {
      _selectedImage = pickedImage;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Add a meal"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.9,
            child: Column(
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
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Column(
                  children: [
                    TextField(
                      controller: _controllerName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name of the meal',
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    DropdownMenu<Filters>(
                      width: double.infinity,
                      controller: _controllerFilters,
                      requestFocusOnTap: false,
                      label: const Text('Filter'),
                      dropdownMenuEntries: Filters.values
                          .map<DropdownMenuEntry<Filters>>((Filters filter) {
                        return DropdownMenuEntry<Filters>(
                          value: filter,
                          label: filter.name,
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    DropdownMenu<Time>(
                      width: double.infinity,
                      controller: _controllerTime,
                      requestFocusOnTap: false,
                      label: const Text('Time'),
                      dropdownMenuEntries:
                          Time.values.map<DropdownMenuEntry<Time>>((Time time) {
                        return DropdownMenuEntry<Time>(
                          value: time,
                          label: time.name,
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    TextField(
                      controller: _controllerIngredients,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter the ingredients here',
                      ),
                      maxLines: null,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    TextField(
                      controller: _controllerReceipt,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter the ingredients here',
                      ),
                      maxLines: null,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Post this great Meal",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: 1),
    );
  }
}
