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
    // Get the screen width to scale the font size
    double screenWidth = MediaQuery.of(context).size.width;

    // Scale factor for font size, adjust as needed
    double fontSizeScale = screenWidth / 375;
    return GestureDetector(
      onTap: onPress,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 50*fontSizeScale,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(fontSize: 26*fontSizeScale, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
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
    // Get the screen width to scale the font size
    double screenWidth = MediaQuery.of(context).size.width;

    // Scale factor for font size, adjust as needed
    double fontSizeScale = screenWidth / 375;
    return GestureDetector(
      onTap: onPress,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 60*fontSizeScale,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(fontSize: 26*fontSizeScale, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
          )
        ],
      ),
    );
  }
}
