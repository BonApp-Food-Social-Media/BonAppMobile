import 'package:bon_app_mobile/models/food_model.dart';


class FoodListSingleton {
  static final FoodListSingleton _foodListSingleton = FoodListSingleton._internal();

  List<FoodModel>? foodsList;

  factory FoodListSingleton() {
    return _foodListSingleton;
  }

  FoodListSingleton._internal();

  void setFoodList(List<FoodModel> foods) {
    foodsList = foods;
  }

  void clearFoodList() {
    foodsList = [];
  }
}
