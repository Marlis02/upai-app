import 'package:ctmax_upai/layout.dart';
import 'package:ctmax_upai/screens/login_screen/login_screen.dart';
import 'package:ctmax_upai/styles/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
      theme: defaultTheme,
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        MainLayout.routeName: (context) => const MainLayout(),
      },
    );
  }
}
