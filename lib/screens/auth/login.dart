import 'package:bon_app_mobile/data/user_data.dart';
import 'package:bon_app_mobile/models/user_model.dart';
import 'package:bon_app_mobile/screens/main/home_page.dart';
import 'package:bon_app_mobile/singleton/active_user_singleton.dart';
import 'package:bon_app_mobile/singleton/food_list_singleton.dart';
import 'package:flutter/material.dart';
import 'package:bon_app_mobile/data/food_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  User? activeUser;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BonApp - Cook or be Cooked",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: screenWidth * 0.8,
          height: screenHeight * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome to BonApp",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Nice to have you here. Please sign in with an existing account",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: Color(0xFF123456),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF123456)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF123456)),
                  ),
                ),
                keyboardType: TextInputType.text,
                autocorrect: false,
                cursorColor: const Color(0xFF123456),
                controller: _controllerUsername,
                enableSuggestions: false,
                textCapitalization: TextCapitalization.none,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Color(0xFF123456),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF123456)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF123456)),
                  ),
                ),
                cursorColor: const Color(0xFF123456),
                obscureText: true,
                controller: _controllerPassword,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF123456),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFf3f3e0),
                        ),
                        onPressed: () {
                          try {
                            if (_controllerPassword.text != "" && _controllerUsername.text != "") {
                              activeUser = userData.firstWhere(
                                (user) =>
                                    user.username == _controllerUsername.text &&
                                    user.password == _controllerPassword.text,
                              );
                              if (activeUser != null) {
                                ActiveUserSingleton().setUser(activeUser!);
                                FoodListSingleton().setFoodList(foods);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePageScreen(),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please fill all the inputs correctly."),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("User not found or credentials are incorrect."),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF123456),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password? Reset password here",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF123456),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
