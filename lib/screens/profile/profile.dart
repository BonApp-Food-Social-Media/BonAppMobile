import 'package:bon_app_mobile/data/food_data.dart';
import 'package:bon_app_mobile/global_widgets/custom_navigation_bar.dart';
import 'package:bon_app_mobile/global_widgets/custom_profile_tab_bar.dart';
import 'package:bon_app_mobile/models/food_model.dart';
import 'package:bon_app_mobile/screens/profile/settings.dart';
import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../singleton/active_user_singleton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<FoodModel> _mealsMade = [];
  User? activeUser = ActiveUserSingleton().activeUser;

  @override
  void initState() {
    super.initState();
    _mealsMade = foodsFoodCourtData
        .where((meal) => meal.username == activeUser!.username)
        .toList();
    _mealsMade += foodsFollowingData
        .where((meal) => meal.username == activeUser!.username)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Your Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: FadeInImage(
                    placeholder: const AssetImage(
                        "assets/images/empty_profile_pic.webp"),
                    image: NetworkImage(activeUser!.profilePicURL),
                    fit: BoxFit.cover,
                    width: 75,
                    height: 75,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.1,
                ),
                Text(
                  activeUser!.username,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${_mealsMade.length} Meals",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${activeUser!.followersUsername.length} Followers",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${activeUser!.followingUsername.length} Following",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            // Expanded(
              ProfileTabView(),
            // )


          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: 3),
    );
  }
}
