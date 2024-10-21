import 'package:bon_app_mobile/data/data.dart';
import 'package:bon_app_mobile/widgets/MealMainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/FoodModel.dart';

class FoodCourtScreen extends StatefulWidget {
  const FoodCourtScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FoodCourtScreenState();
  }
}

class _FoodCourtScreenState extends State<FoodCourtScreen> {
  List<FoodModel> _foods = [];
  final List<FoodModel> _swipedFoodsRight = [];

  var _isFoodCourt = true;

  @override
  void initState() {
    super.initState();
    _foods = List.from(foodsData);
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
              child: Text("Following", style: TextStyle(color: _isFoodCourt ? Colors.black : Colors.blue, fontSize: 20),),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  _isFoodCourt = true;
                });
              },
              child: Text("Food Court", style: TextStyle(color: _isFoodCourt ? Colors.blue : Colors.black, fontSize: 20),),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            if (_foods.isEmpty)
              Center(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Center(
                      child: Text(
                        "You reached the end 😲. There are no new meal ideas. \n Try again later and don't tell anyone about the easter egg",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              )
            else
              for (var i = 0; i < _foods.length; i++)
                MealMainPage(
                  foodModel: _foods[i],
                  onDismissed: (direction) {
                    setState(() {
                      if (direction == DismissDirection.startToEnd) {
                        _swipedFoodsRight.add(_foods[i]);
                      }
                      _foods.removeAt(i);
                    });
                  },
                )
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.white, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home Page"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "New Post"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Account"),
      ]),
    );
  }
}
