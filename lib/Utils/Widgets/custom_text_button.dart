import 'package:flutter/cupertino.dart';

import '../colors.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  const CustomTextButton({
    super.key, required this.onPress, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width to scale the font size
    double screenWidth = MediaQuery.of(context).size.width;

    // Scale factor for font size, adjust as needed
    double fontSizeScale = screenWidth / 375;
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: GestureDetector(
        onTap: onPress,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20*fontSizeScale,
            color: kRedColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
