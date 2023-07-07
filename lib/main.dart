import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:techpack_demo/apps/auth/auth_controller.dart';
import 'package:techpack_demo/widgets/my_scaffold.dart';

import 'apps/apps.dart';
import 'apps/auth/views/auth_screen.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TechPack Demo',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange[900] ?? Colors.orange),
          useMaterial3: true,
        ),
        home: ChangeNotifierProvider(
          create: (_) => AuthController()..init(),
          child: Consumer<AuthController>(
            builder:
                (BuildContext context, AuthController value, Widget? child) {
              return value.isAuth ? child! : AuthScreen();
            },
            child: const MyScaffold(),
          ),
        ));
  }
}
