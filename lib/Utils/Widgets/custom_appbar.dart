import 'package:carsave/Routes/routes.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Theme.of(context).primaryColor,
            size: 50,
          ),
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: Theme.of(context).indicatorColor,
          radius: 25,
          child: Image.asset(logo),
        ),
        IconButton(
          icon: Icon(
            Icons.menu_rounded,
            color: Theme.of(context).primaryColor,
            size: 45,
          ),
          onPressed: () {
            Get.toNamed(RoutesPath.userProfile);
          },
        ),
      ],
    );
  }
}
