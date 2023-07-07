import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

///
class AuthScreen extends StatefulWidget {
  ///
  const AuthScreen({super.key});

  static const routeName = '/signin';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isRegisterScreen = false;

  @override
  void initState() {
    phoneNumber.text = "99000000";
    password.text = "12345689";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumber.dispose();
    password.dispose();
  }

  toggleScreen() {
    setState(() {
      _isRegisterScreen = !_isRegisterScreen;
    });
    phoneNumber.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                _isRegisterScreen ? 'Хаяг үүсгэх' : 'Нэвтрэх',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text.rich(
                TextSpan(
                  text: _isRegisterScreen
                      ? 'Бүртгэлтэй бол? '
                      : 'Нэвтрэх хаяг байхгүй бол? ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: _isRegisterScreen ? 'Нэвтрэх' : 'Хаяг үүсгэх',
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()..onTap = toggleScreen,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
              LoginForm(
                phoneNumber: phoneNumber,
                password: password,
                formKey: _formKey,
                isRegisterScreen: _isRegisterScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
