import 'package:ctmax_upai/components/bottomNavigation/bottom_navigation.dart';
import 'package:ctmax_upai/layout.dart';
import 'package:ctmax_upai/pages/login_page.dart';
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
      home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        MainLayout.routeName: (context) => const MainLayout(),
      },
    );
  }
}
