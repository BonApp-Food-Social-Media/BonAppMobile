import 'package:bon_app_mobile/screens/newMeals/newMeal.dart';
import 'package:flutter/material.dart';
import '../../models/UserModel.dart';
import '../main/homePage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});

  final User user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
    }
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
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: FadeInImage(
                    placeholder: const NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    image: NetworkImage(widget.user.profilePicURL),
                    fit: BoxFit.cover,
                    width: 75,
                    height: 75,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.user.username,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${widget.user.mealsMade.length} Meals",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "${widget.user.followers.length} Followers",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "${widget.user.following.length} Following",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            GridView(
              padding: const EdgeInsets.all(24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3/2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              // for(var i = 0; i < widget.user.mealsMade.length; i++)
              //TODO implement here a new widgets to show the meals made by the logged in user. Also go look at the meals app...
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
