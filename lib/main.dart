import 'package:ctmax_upai/service_locator.dart';
import 'package:ctmax_upai/layout.dart';
import 'package:ctmax_upai/screens/login_screen/login_screen.dart';
import 'package:ctmax_upai/screens/register_screen/register_screen.dart';
import 'package:ctmax_upai/styles/theme.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpaiApp();
  }
}

class UpaiApp extends StatelessWidget {
  const UpaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: const LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        MainLayout.routeName: (context) => const MainLayout(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
      },
    );
  }
}
