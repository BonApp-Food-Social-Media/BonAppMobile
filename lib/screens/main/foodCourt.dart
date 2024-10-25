import 'package:bon_app_mobile/models/FoodModel.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/MealMainPage.dart';

class FoodCourtScreen extends StatefulWidget {
  const FoodCourtScreen({super.key, required this.foods, required this.isFoodCourt, required this.onDismissed});

  final List<FoodModel> foods;
  final bool isFoodCourt;
  final void Function(DismissDirection, FoodModel) onDismissed;  // Passe den Typ an

  @override
  State<StatefulWidget> createState() {
    return _FoodCourtScreenState();
  }
}

class _FoodCourtScreenState extends State<FoodCourtScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          if (widget.foods.isEmpty)
            Center(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text(
                      "You reached the end 😲. There are strangely no new meal ideas. \n Try again later and don't tell anyone about the easter egg",
                      style: TextStyle(fontSize: 30),
                    ),
                  )),
            )
          else
            for (var i = 0; i < widget.foods.length; i++)
              MealMainPage(
                foodModel: widget.foods[i],
                onDismissed: (direction) {
                  widget.onDismissed(direction, widget.foods[i]);
                },
                isFoodCourt: widget.isFoodCourt,
              )
        ],
      ),
    );
  }
}
