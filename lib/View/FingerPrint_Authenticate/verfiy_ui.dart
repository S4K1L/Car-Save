import 'package:carsave/View/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FingerPrintVerify extends StatefulWidget {
  const FingerPrintVerify({super.key});

  @override
  _FingerPrintVerifyState createState() => _FingerPrintVerifyState();
}

class _FingerPrintVerifyState extends State<FingerPrintVerify> {
  @override
  void initState() {
    super.initState();

    // Delaying navigation to HomePage after 3 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAll(() => HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.25),
            child: Lottie.asset("assets/fin2.json", repeat: false),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              "Verify Successfully",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 22,
                color: Color(0xFF009C10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
