import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.black,
                    child: SvgPicture.asset(
                      "assets/vk_icon.svg",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                          style: ButtonStyle(
                              iconColor:
                                  WidgetStateProperty.all(AppColors.white),
                              backgroundColor:
                                  WidgetStateProperty.all(AppColors.primary)),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                          )))
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  "Last Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            )),
            SizedBox(
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            )
          ],
        ));
  }
}
