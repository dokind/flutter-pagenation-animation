import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void login(String phone, String password) {
    _isAuth = true;
    notifyListeners();
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }
}
