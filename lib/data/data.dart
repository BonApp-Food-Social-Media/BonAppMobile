import 'package:bon_app_mobile/models/FoodModel.dart';
import 'package:bon_app_mobile/models/UserModel.dart';

const List<FoodModel> foodsData = [
  FoodModel(
      id: 1,
      name: "Lasagne",
      imageURL:
          "https://files.cleverleben.at/clever_downloads/recipes/Recipe_316.jpg",
      minutes: 800,
      ingredients: ["first", "Second"],
      steps: ["third", "fourth"],
      user: User(
          id: 1,
          username: "helloWorld",
          email: "hello@world.com",
          password: "123456",
          likedMeals: [],
          profilePicURL:
              "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg")),
  FoodModel(
      id: 1,
      name: "Spaghetti Bolognese",
      imageURL:
          "https://img.hellofresh.com/f_auto,fl_lossy,h_640,q_auto,w_1200/hellofresh_s3/image/klassische-pasta-bolognese-mit-rinderhack-thermomix-a5dbe0ad.jpg",
      minutes: 800,
      ingredients: ["first", "Second"],
      steps: ["third", "fourth"],
      user: User(
          id: 1,
          username: "helloWorld",
          email: "hello@world.com",
          password: "123456",
          likedMeals: [],
          profilePicURL:
              "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg")),
  FoodModel(
      id: 1,
      name: "Pizza Margherita",
      imageURL: "https://img1.kochrezepte.at/use/1/pizza-margherita_1755.jpg",
      minutes: 800,
      ingredients: ["first", "Second"],
      steps: ["third", "fourth"],
      user: User(
          id: 1,
          username: "helloWorld",
          email: "hello@world.com",
          password: "123456",
          likedMeals: [],
          profilePicURL:
              "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg")),
  FoodModel(
      id: 1,
      name: "Pizza Prosciutto",
      imageURL:
          "https://www.lieferando.de/foodwiki/uploads/sites/8/2019/04/pizza-prosciutto-crudo-1080x1080.jpg",
      minutes: 800,
      ingredients: ["first", "Second"],
      steps: ["third", "fourth"],
      user: User(
          id: 1,
          username: "helloWorld",
          email: "hello@world.com",
          password: "123456",
          likedMeals: [],
          profilePicURL:
              "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg")),
  FoodModel(
      id: 1,
      name: "Caesers Salad",
      imageURL:
          "https://www.jocooks.com/wp-content/uploads/2020/07/caesar-salad-1-12.jpg",
      minutes: 800,
      ingredients: ["first", "Second"],
      steps: ["third", "fourth"],
      user: User(
          id: 1,
          username: "helloWorld",
          email: "hello@world.com",
          password: "123456",
          likedMeals: [],
          profilePicURL:
              "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg")),
];
