import 'package:carsave/Controller/theme_controller.dart';
import 'package:carsave/Utils/Authentication/auth_gate.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/View/Login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Routes/routes.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Start the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Inject ThemeController into the dependency injection system
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Save',
      // Use Obx to reactively listen to theme changes
      theme: themeController.isDarkTheme.value ? darkTheme : lightTheme,
      // AuthGate for authentication logic
      home: const AuthGate(),
      // Define initial route
      initialRoute: RoutesPath.initialization,
      // GetX pages
      getPages: pages,
    );
  }
}
