import 'package:bon_app_mobile/models/UserModel.dart';

const List<User> userData = [
  User(
    id: 1,
    username: "user",
    email: "user1@mail.com",
    password: "hallo",
    likedMeals: [],
    profilePicURL:
        "https://mmbe.ch/wspx/site/assets/files/1814/img_2601.1000x0-is.jpeg",
    following: [],
    followers: [],
    mealsMade: [],
  ),
  User(
    id: 2,
    username: "user2",
    email: "user2@mail.com",
    password: "hallo",
    likedMeals: [],
    profilePicURL:
        "https://img.freepik.com/fotos-kostenlos/selbstbewusster-huebscher-kerl-der-gegen-die-weisse-wand-aufwirft_176420-32936.jpg?t=st=1729840286~exp=1729843886~hmac=5660fb42e8d6cffb128a2a8fa1668bc66c2436a4e5512f6d48ce049dd5467723&w=1380",
    following: [],
    followers: [],
    mealsMade: [],
  ),
  User(
    id: 3,
    username: "user3",
    email: "user3@mail.com",
    password: "hallo",
    likedMeals: [],
    profilePicURL:
        "https://img.freepik.com/fotos-kostenlos/attraktiver-mischling-mit-positivem-laecheln-zeigt-weisse-zaehne-haelt-die-haende-auf-dem-bauch-ist-in-hochstimmung-traegt-ein-weisses-hemd-und-freut-sich-ueber-positive-momente-im-leben-menschen-und-emotionskonzept_273609-15527.jpg?t=st=1729840310~exp=1729843910~hmac=bbc1daef2fc30ab7ea01346ae2b31d4af217d691a08a9147abb3b166e95bc712&w=1380",
    following: [],
    followers: [],
    mealsMade: [],
  ),
];

const User dummyUser = User(
    id: 9000,
    username: "DummyUser",
    email: "dummy@user.com",
    password: "123546",
    likedMeals: [],
    profilePicURL:
        "https://img.freepik.com/premium-vector/businessman-avatar-illustration-cartoon-user-portrait-user-profile-icon_118339-4382.jpg",
    following: [],
    followers: [],
    mealsMade: []);
