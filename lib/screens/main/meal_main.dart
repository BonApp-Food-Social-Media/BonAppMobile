import 'package:bon_app_mobile/models/food_model.dart';
import 'package:flutter/material.dart';

class MealMainPage extends StatelessWidget {
  const MealMainPage({
    super.key,
    required this.foodModel,
    required this.onDismissed,
    required this.isFoodCourt,
  });

  final FoodModel foodModel;
  final Function(DismissDirection) onDismissed;
  final bool isFoodCourt;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Dismissible(
        key: ObjectKey(foodModel),
        direction: DismissDirection.horizontal,
        onDismissed: onDismissed,
        background: Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: const Icon(Icons.check, color: Colors.black, size: 50,),
        ),
        secondaryBackground: Container(
          color: Colors.white,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.delete, color: Colors.black, size: 50,),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    foodModel.username,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  if(isFoodCourt)
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Subscribe",
                          style: TextStyle(fontSize: 15),
                        ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage(
                placeholder: const AssetImage(
                  "assets/images/placeholder_or_error_image.jpg"
                ),
                image: NetworkImage(
                  foodModel.imageURL,
                ),
                fit: BoxFit.cover,
                width: screenWidth * 0.8,
                height: screenHeight * 0.5,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/placeholder_or_error_image.jpg", // Use the same placeholder image
                    fit: BoxFit.cover,
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.5,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              foodModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(
                  Icons.outlined_flag,
                  size: 30,
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(
                  Icons.bookmark_border,
                  size: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
