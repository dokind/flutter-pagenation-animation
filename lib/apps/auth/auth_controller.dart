import 'dart:developer';

import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthController extends ChangeNotifier {
  bool _isAuth = false;
  AuthMode _authMode = AuthMode.Login;

  bool get isAuth => _isAuth;
  AuthMode get authMode => _authMode;

  get formKey => GlobalKey<FormState>();

  // TODO get from shared preferences or secure storage
  init() {
    log('init');

    /// түрдээ заавал
    _isAuth = false;
    notifyListeners();
  }

  /// TODO send otp
  sendOtp(String phone) {}

  /// TODO verify otp
  verifyOtp(String phone, String otp) {
    // sendOtp(phone);
  }

  Future<void> login(String phone, String password) async {
    _isAuth = true;
    notifyListeners();
  }

  void logout() {
    log('logout');
    _isAuth = false;
    notifyListeners();
  }
}
