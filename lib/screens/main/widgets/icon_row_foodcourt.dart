import 'package:bon_app_mobile/screens/report/report_meal.dart';
import 'package:flutter/material.dart';

import '../../../models/food_model.dart';
import '../../../models/user_model.dart';
import '../../../singleton/active_user_singleton.dart';

class IconRowFoodCourt extends StatefulWidget {
  const IconRowFoodCourt({
    super.key,
    required this.foodModel,
  });

  final FoodModel foodModel;

  @override
  State<StatefulWidget> createState() {
    return _IconRowFoodCourt();
  }
}

class _IconRowFoodCourt extends State<IconRowFoodCourt> {
  User? activeUser = ActiveUserSingleton().activeUser;
  bool? liked;
  bool? saved;

  @override
  void initState() {
    super.initState();
    liked = activeUser?.likedMeals.contains(widget.foodModel.id) ?? false;
    saved = activeUser?.favoredMeals.contains(widget.foodModel.id) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        liked!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    liked = false;
                    //TODO implement database here and not only delete the liked meal in the singleton but in the user in the database
                    activeUser!.likedMeals.remove(widget.foodModel.id);
                  });
                },
                icon: const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.red,
                ),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    liked = true;
                    //TODO implement database here and not only set the liked meal in the singleton but in the user in the database
                    activeUser!.likedMeals.add(widget.foodModel.id);
                  });
                },
                icon: const Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
              ),
        const SizedBox(
          width: 50,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportMeal(meal: widget.foodModel),
              ),
            );
          },
          icon: const Icon(
            Icons.outlined_flag,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        saved!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    saved = false;
                    //TODO implement database here and not only delete the favored meal in the singleton but in the user in the database
                    activeUser!.favoredMeals.remove(widget.foodModel.id);
                  });
                },
                icon: const Icon(
                  Icons.bookmark,
                  size: 30,
                ),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    saved = true;
                    //TODO implement database here and not only set the favored meal in the singleton but in the user in the database
                    activeUser!.favoredMeals.add(widget.foodModel.id);
                  });
                },
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 30,
                ),
              ),
      ],
    );
  }
}
