import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(double.infinity, 100),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.black.withOpacity(0.1))),
          backgroundColor: AppColors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.black,
            child: const Icon(
              Icons.person_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Имя пользователя",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(
            Icons.chevron_right_rounded,
            size: 40,
          ),
          subtitle: const Text("Profile"),
        ));
  }
}
