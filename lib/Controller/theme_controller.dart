import 'package:carsave/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Create a reactive variable to track the theme state
  var isDarkTheme = false.obs;

  // Toggle between light and dark theme
  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(isDarkTheme.value ? darkTheme : lightTheme); // Use dark or light theme
    saveThemePreference(isDarkTheme.value); // Save theme preference
  }

  // Save theme preference to persistent storage
  void saveThemePreference(bool isDark) async {
    // You can use SharedPreferences or other storage here
  }

  // Load theme preference from storage
  void loadThemePreference() async {
    // You can load the saved preference here
  }
}
