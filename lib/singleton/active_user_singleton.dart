import '../models/user_model.dart';

class ActiveUserSingleton {
  static final ActiveUserSingleton _activeUserSingleton = ActiveUserSingleton._internal();

  User? activeUser;

  factory ActiveUserSingleton() {
    return _activeUserSingleton;
  }

  ActiveUserSingleton._internal();

  void setUser(User user) {
    activeUser = user;
  }

  void clearUser() {
    activeUser = null;
  }
}
