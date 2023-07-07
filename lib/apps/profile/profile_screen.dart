import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techpack_demo/apps/auth/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: TextButton(
                onPressed: context.read<AuthController>().logout,
                child: const Text('Logout'))),
      ),
    );
  }
}
