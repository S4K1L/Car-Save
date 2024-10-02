import 'package:carsave/Utils/colors.dart';
import 'package:flutter/material.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.onPress,
    required this.title,
    required this.icon,
  });

  final VoidCallback onPress;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 50,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}


class CustomProfileIconButton extends StatelessWidget {
  const CustomProfileIconButton({
    super.key,
    required this.onPress,
    required this.title,
    required this.icon,
  });

  final VoidCallback onPress;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 60,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
          )
        ],
      ),
    );
  }
}
