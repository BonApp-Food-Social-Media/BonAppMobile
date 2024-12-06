import 'dart:io';

import 'package:bon_app_mobile/models/food_model.dart';
import 'package:bon_app_mobile/models/user_model.dart';
import 'package:bon_app_mobile/singleton/active_user_singleton.dart';
import 'package:flutter/material.dart';
import '../../enum/filters.dart';
import '../../enum/time.dart';
import '../../global_widgets/user_image_picker.dart';
import '../../singleton/food_list_singleton.dart';

class NewMealScreen extends StatefulWidget {
  const NewMealScreen({super.key});

  @override
  _NewMealScreenState createState() => _NewMealScreenState();
}

class _NewMealScreenState extends State<NewMealScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerTime = TextEditingController();
  final TextEditingController _controllerIngredients = TextEditingController();
  final TextEditingController _controllerRecipe = TextEditingController();
  File? _selectedImage;
  List<Filters> selectedFilters = [];
  List<FoodModel>? meals = FoodListSingleton().foodsList;


  User? activeUser = ActiveUserSingleton().activeUser;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool validMeal = _controllerName.text.trim().isNotEmpty &&
        _controllerTime.text.trim().isNotEmpty &&
        _controllerIngredients.text.trim().isNotEmpty &&
        _controllerRecipe.text.trim().isNotEmpty &&
        _selectedImage != null &&
        selectedFilters.isNotEmpty;

    void showFilterSelectionDialog() async {
      List<Filters> tempSelectedFilters = List.from(selectedFilters);

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return AlertDialog(
                title: const Text("Select Filters"),
                content: SizedBox(
                  width: double.maxFinite,
                  child: ListView(
                    children: Filters.values.map((filter) {
                      return CheckboxListTile(
                        title: Text(filter.name),
                        value: tempSelectedFilters.contains(filter),
                        onChanged: (bool? isChecked) {
                          setDialogState(() {
                            if (isChecked == true) {
                              tempSelectedFilters.add(filter);
                            } else {
                              tempSelectedFilters.remove(filter);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedFilters = tempSelectedFilters;
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                  )),
              const Text(
                "Add a meal",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.9,
            child: Column(
              children: [
                UserImagePicker(
                  onPickImage: (pickedImage) {
                    setState(() {
                      _selectedImage = pickedImage;
                    });
                  },
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
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          showFilterSelectionDialog();
                        },
                        child: Text(
                          selectedFilters.isEmpty
                              ? "Select Filters"
                              : "Filters: ${selectedFilters.map((e) => e.name).join(', ')}",
                        ),
                      ),
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
                      controller: _controllerRecipe,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter the recipe here',
                      ),
                      maxLines: null,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: validMeal
                          ? () {
                              FoodModel newMeal = FoodModel(
                                id: DateTime.now().millisecondsSinceEpoch,
                                name: _controllerName.text.trim(),
                                imagePath: _selectedImage!.path,
                                time: Time.values.firstWhere(
                                  (t) => t.name == _controllerTime.text.trim(),
                                  orElse: () => Time.fast,
                                ),
                                ingredients: _controllerIngredients.text.trim(),
                                steps: _controllerRecipe.text.trim(),
                                username: activeUser!.username,
                                filters: selectedFilters,
                              );
                              meals!.add(newMeal);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Meal posted!")),
                              );
                              Navigator.pop(context);

                              //TODO Implement the backend here

                            }
                          : null, // Disable button if not valid
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
    );
  }
}
