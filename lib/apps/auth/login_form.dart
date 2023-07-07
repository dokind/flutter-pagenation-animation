import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:techpack_demo/apps/auth/auth_controller.dart';
import 'package:techpack_demo/utils/extentions.dart';

import 'labeled_text_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.phoneNumber,
    required this.password,
    required this.formKey,
    required this.isRegisterScreen,
  }) : super(key: key);

  ///
  final TextEditingController phoneNumber;

  ///
  final TextEditingController password;

  ///
  final GlobalKey<FormState> formKey;

  ///
  final bool isRegisterScreen;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  List<String> _errorText = [];
  List<String> get errorText => _errorText;
  set errorText(List<String> errorText) =>
      setState(() => _errorText = errorText);
  bool isTermsChecked = true;

  @override
  Widget build(BuildContext context) {
    if (!widget.isRegisterScreen) {
      isTermsChecked = true;
    }
    return Consumer<AuthController>(
      builder: (context, AuthController, child) {
        return Form(
          key: widget.formKey,
          // autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabeledTextInput(
                onSubmit: (_) => _submitForm,
                keyboardType: TextInputType.phone,
                controller: widget.phoneNumber,
                autoFocus: false,
                hintText: "Phone number",
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Зөв дугаар оруулнa байгаа...';
                  }
                  if (value!.isPhoneNumber()) {
                    return 'Зөв дугаар оруулна шүү!';
                  }
                  return null;
                },
                autofillHints: const [
                  AutofillHints.telephoneNumber,
                ],
                onChanged: (_) => setState(() {}),
              ),

              LabeledTextInput(
                onSubmit: (_) => _submitForm,
                controller: widget.password,
                validator: (value) {
                  if (widget.isRegisterScreen) {
                    if (value == null || value.isEmpty) {
                      return 'Шинэ нууц үгээ оруулна уу';
                    }
                    if (!value.isStrongPassword()) {
                      return 'Таны нууц үг сул байна';
                    }
                  } else {
                    if (value == null || value.isEmpty) {
                      return 'Нууц үгээ оруулна уу';
                    }
                  }
                  return null;
                },
                hintText: "Нууц үг",
                autofillHints: const [AutofillHints.password],
                onChanged: (_) => setState(() {}),
                obscureText: true,
              ),

              if (_errorText.isNotEmpty) ...[
                ..._errorText.map(
                  (e) => Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                ),
              ],

              /// terms and conditions button
              ElevatedButton(
                onPressed: _submitForm,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.isRegisterScreen ? 'Бүртгүүлэх' : 'Нэвтрэх',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _submitForm() async {
    errorText = [];
    if (widget.formKey.currentState!.validate()) {
      // If the form is valid, submit it.
      final auth = context.read<AuthController>();
      try {
        if (widget.isRegisterScreen) {
          await auth.sendOtp(widget.phoneNumber.text);
          await auth.verifyOtp(
            widget.phoneNumber.text,
            widget.password.text,
          );
        } else {
          await auth.login(
            widget.phoneNumber.text,
            widget.password.text,
          );
        }
      } on Exception catch (e) {
        String errorMessage = e.toString();
        errorText = [errorMessage];
      }
      widget.password.clear();
    } else {
      // errorText = [
      //   'Register failed. Please check your email and password and try again.'
      // ];
    }
  }
}
