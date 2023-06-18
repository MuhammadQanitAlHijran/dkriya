import 'package:flutter/material.dart';
import 'package:project_dkriya/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user = new UserModel();
  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  bool login({String email = "", String password = ""}) {
    if (email == "dkriya@gmail.com" && password == "dkriya") {
      user = UserModel(
          id: 1, name: "Dkriya", email: "dkriya@gmail.com", username: "Dkriya");
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
