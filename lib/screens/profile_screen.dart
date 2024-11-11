import 'package:ctmax_upai/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text('ProfileScreen'),
      TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          },
          child: Text('Logout'))
    ]));
  }
}
