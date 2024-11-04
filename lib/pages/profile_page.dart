import 'package:ctmax_upai/pages/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text('ProfilePage'),
      TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          },
          child: Text('Logout'))
    ]));
  }
}
