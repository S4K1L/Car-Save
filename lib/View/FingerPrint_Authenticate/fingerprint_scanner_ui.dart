import 'package:carsave/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import '../../Controller/local_auth_api.dart';
import '../../Utils/Widgets/custom_widgets.dart';
import '../../Utils/const.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({super.key});

  @override
  State<FingerprintPage> createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  bool isAvailable = false; // Initialize with default values
  bool hasFingerprint = false;

  // Corrected: Proper async call and state management
  Future<void> checkAvailable() async {
    try {
      final biometricsAvailable = await LocalAuthApi.hasBiometrics();
      final biometrics = await LocalAuthApi.getBiometrics();

      setState(() {
        isAvailable = biometricsAvailable;
        hasFingerprint = biometrics.contains(BiometricType.fingerprint);
      });
    } catch (e) {
      // Handle any error here, log or display an error message if necessary
      print("Error checking biometrics: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    // Call checkAvailable when the widget initializes
    checkAvailable();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: kBackgroundColor,
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.7,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white70,
                    child: Image.asset(logo),
                  ),
                ),
                Text(
                  "Login with your",
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                Text(
                  "Fingerprint",
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
              border: Border.all(color: Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Let us know it's you by one-click authentication",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  LottieBuilder.asset(
                    "assets/fin.json",
                    repeat: true,
                  ),
                  // Use FutureBuilder to handle async call results
                  FutureBuilder(
                    future: checkAvailable(), // Future to be resolved
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(
                          color: Colors.green,
                          strokeWidth: 2,
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildText('Fingerprint Availability', hasFingerprint),
                            authenticateButton(context), // Add your authentication button logic here
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
