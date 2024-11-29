class User{
  const User({
    required this.username,
    required this.email,
    required this.password,
    required this.favoredMeals,
    required this.followingUsername,
    required this.followersUsername,
    required this.likedMeals,
    required this.swipedMeals,
});

  final String username;
  final String email;
  final String password;
  final List<int> favoredMeals;
  final List<String> followingUsername;
  final List<String> followersUsername;
  final List<int> likedMeals;
  final List<int> swipedMeals;
}

//TODO potentially also change the profile pic to a local image.