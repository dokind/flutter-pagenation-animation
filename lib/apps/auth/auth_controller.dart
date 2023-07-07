import 'dart:developer';

import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  get formKey => GlobalKey<FormState>();

  // TODO get from shared preferences or secure storage
  init() {
    log('init');

    /// түрдээ заавал
    _isAuth = false;
    notifyListeners();
  }

  /// TODO send otp
  sendOtp(String phone) async {}

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
