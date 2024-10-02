import 'package:carsave/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTopContainer extends StatelessWidget {
  const LoginTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.white70,
              child: Image.asset(logo)),
        ),
        sizeBox,
        Text(
          loginSubTitle,
          style: GoogleFonts.patuaOne(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              letterSpacing: 1.5
          ),
        ),
        size2xBox,
      ],
    );
  }
}
