import 'package:bon_app_mobile/global_widgets/custom_navigation_bar.dart';
import 'package:bon_app_mobile/models/user_model.dart';
import 'package:bon_app_mobile/screens/main/widgets/food_court.dart';
import 'package:bon_app_mobile/singleton/active_user_singleton.dart';
import 'package:flutter/material.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  User? activeUser = ActiveUserSingleton().activeUser;
  var _isFoodCourt = true;

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
          ? const FoodCourtScreen(
              isFoodCourt: true,
            )
          : const FoodCourtScreen(
              isFoodCourt: false,
            ),
      bottomNavigationBar: const CustomNavigationBar(initialIndexOfScreen: 0),
    );
  }
}
