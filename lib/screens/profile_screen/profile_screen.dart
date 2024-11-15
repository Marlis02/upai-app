import 'package:ctmax_upai/screens/profile_screen/profile_widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all( 10),
        child: Column(
          children: [
            ProfileHeaderWidget(),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.insights),
              title: Text("Активность"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Настройки"),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Вопросы и ответы"),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text("Связаться с подержкой"),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Поделиться приложением"),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            const Spacer(),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.red,
              ),
              onTap: () {},
              title: const Text(
                "Выход",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ));
  }
}
