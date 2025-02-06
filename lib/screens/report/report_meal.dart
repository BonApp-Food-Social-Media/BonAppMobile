import 'package:bon_app_mobile/data/user_data.dart';
import 'package:bon_app_mobile/enum/report_reasons.dart';
import 'package:bon_app_mobile/models/food_model.dart';
import 'package:bon_app_mobile/models/reported_meal_list.dart';
import 'package:bon_app_mobile/models/user_model.dart';
import 'package:bon_app_mobile/screens/personal_profile/profile.dart';
import 'package:bon_app_mobile/singleton/reported_meal_singleton.dart';
import 'package:flutter/material.dart';

class ReportMeal extends StatelessWidget {
  const ReportMeal({super.key, required this.meal});

  final FoodModel meal;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerReport = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<ReportedMealListModel> reportedMealsList =
        ReportedMealSingleton().reportedMealList != null ? ReportedMealSingleton().reportedMealList! : [];

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
              ),
            ),
            const Text(
              "Report Meal",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Reporting ${meal.name}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            GestureDetector(
              onTap: () {
                User userToShow = userData.where((user) => user.username == meal.username).first;
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
                "This meal was mady by " + meal.username,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              "If you want to report this meal you are able to do so. Just choose which option goes best with the problem of the meal",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            DropdownMenu<ReportReasons>(
              width: double.infinity,
              controller: _controllerReport,
              requestFocusOnTap: false,
              label: const Text('Report Reasons'),
              dropdownMenuEntries:
                  ReportReasons.values.map<DropdownMenuEntry<ReportReasons>>((ReportReasons reportReason) {
                return DropdownMenuEntry<ReportReasons>(
                  value: reportReason,
                  label: reportReason.name,
                );
              }).toList(),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xFF123456)),
              onPressed: () {
                if (_controllerReport.text.trim().isNotEmpty) {
                  reportedMealsList
                      .add(ReportedMealListModel(reportedMealList: meal.id, description: _controllerReport.text));
                  ReportedMealSingleton().setReportedMeal(reportedMealsList);
                  Navigator.pop(context);
                }
              },
              child: Text(
                "Report this meme",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
