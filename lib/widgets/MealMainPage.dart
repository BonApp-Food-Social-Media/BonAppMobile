import 'package:bon_app_mobile/models/FoodModel.dart';
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
        key: UniqueKey(),
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     // ClipRRect(
                  //     //   borderRadius: BorderRadius.circular(50),
                  //     //   child: FadeInImage(
                  //     //     placeholder: const NetworkImage(
                  //     //         "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                  //     //     image: NetworkImage(foodModel.username.profilePicURL),
                  //     //     fit: BoxFit.cover,
                  //     //     width: 50,
                  //     //     height: 50,
                  //     //   ),
                  //     // ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Text(
                  //       foodModel.username,
                  //       style: const TextStyle(
                  //           fontSize: 20, fontWeight: FontWeight.bold),
                  //     ),
                  //   ],
                  // ),
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
                placeholder: const NetworkImage(
                    "https://t4.ftcdn.net/jpg/06/71/92/37/360_F_671923740_x0zOL3OIuUAnSF6sr7PuznCI5bQFKhI0.jpg"),
                image: NetworkImage(
                  foodModel.imageURL,
                ),
                fit: BoxFit.cover,
                width: screenWidth * 0.8,
                height: screenHeight * 0.5,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://t4.ftcdn.net/jpg/06/71/92/37/360_F_671923740_x0zOL3OIuUAnSF6sr7PuznCI5bQFKhI0.jpg", // Use the same placeholder image
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
                  Icons.insert_comment_outlined,
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
