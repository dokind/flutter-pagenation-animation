import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techpack_demo/apps/auth/auth_controller.dart';

import '../login_form.dart';

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
    // final theme = context.watch<AppModel>().theme;
    final auth = context.watch<AuthController>();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // backgroundColor: $styles.colors.body,
      resizeToAvoidBottomInset: true,
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  _isRegisterScreen ? 'Хаяг үүсгэх' : 'Нэвтрэх',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: _isRegisterScreen
                        ? 'Бүртгэлтэй бол? '
                        : 'Нэвтрэх хаяг байхгүй бол? ',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: _isRegisterScreen ? 'Нэвтрэх' : 'Хаяг үүсгэх',
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()
                          ..onTap = toggleScreen,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
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
                _isRegisterScreen
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // context.go(ForgotPasswordScreen.routeName);
                          },
                          child: Text(
                            'Нууц үгээ мартсан?',
                          ),
                        ),
                      ),
                // VSpace(Insets.lg),

                // VSpace(Insets.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
