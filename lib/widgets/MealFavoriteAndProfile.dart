import 'package:bon_app_mobile/models/FoodModel.dart';
import 'package:flutter/material.dart';

class MealFavoriteAndProfile extends StatelessWidget {
  const MealFavoriteAndProfile({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: FadeInImage(
        placeholder: const NetworkImage(
            "https://t4.ftcdn.net/jpg/06/71/92/37/360_F_671923740_x0zOL3OIuUAnSF6sr7PuznCI5bQFKhI0.jpg"),
        image: NetworkImage(
          foodModel.imageURL,
        ),
        fit: BoxFit.cover,
        width: screenWidth * 0.33,
        height: screenHeight * 0.2,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.network(
            "https://t4.ftcdn.net/jpg/06/71/92/37/360_F_671923740_x0zOL3OIuUAnSF6sr7PuznCI5bQFKhI0.jpg", // Use the same placeholder image
            fit: BoxFit.cover,
            width: screenWidth * 0.33,
            height: screenHeight * 0.2,
          );
        },
      ),
    );
  }
}
