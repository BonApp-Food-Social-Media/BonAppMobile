import 'package:bon_app_mobile/data/data.dart';
import 'package:bon_app_mobile/screens/foodCourt.dart';
import 'package:flutter/material.dart';

import '../models/FoodModel.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageScreenState();
  }
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<FoodModel> _foodsFoodCourt = [];
  List<FoodModel> _foodsFollowing = [];
  final List<FoodModel> _swipedFoodsRight = [];

  var _isFoodCourt = true;

  onDismissed(DismissDirection direction, FoodModel food) {
    setState(() {
      if (direction == DismissDirection.startToEnd) {
        _swipedFoodsRight.add(food);


        //TODO implement algorithm here
        for (var i = 0; i < _swipedFoodsRight.length; i++) {
          print(_swipedFoodsRight[i].name);
        }
      }
      _isFoodCourt ? _foodsFoodCourt.remove(food) : _foodsFollowing.remove(food);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _foodsFoodCourt = List.from(foodsFoodCourtData);
      _foodsFollowing = List.from(foodsFollowingData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _isFoodCourt = false;
                });
              },
              child: Text(
                "Following",
                style: TextStyle(
                    color: _isFoodCourt ? Colors.black : Colors.blue,
                    fontSize: 20),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  _isFoodCourt = true;
                });
              },
              child: Text(
                "Food Court",
                style: TextStyle(
                    color: _isFoodCourt ? Colors.blue : Colors.black,
                    fontSize: 20),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _isFoodCourt
          ? FoodCourtScreen(
        foods: _foodsFoodCourt,
        isFoodCourt: true,
        onDismissed: onDismissed,
      )
          : FoodCourtScreen(
        foods: _foodsFollowing,
        isFoodCourt: false,
        onDismissed: onDismissed,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 35,), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.add, size: 35,), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 35,), label: "", ),
          ]),
    );
  }
}
