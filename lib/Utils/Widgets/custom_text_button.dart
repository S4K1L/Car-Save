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
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: GestureDetector(
        onTap: onPress,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: kRedColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
