import 'package:carsave/Controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeChangePage extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Theme.of(context).primaryColor,
            size: 50,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Change Theme'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Theme',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 20),
            Obx(
                  () => Row(
                children: [
                  Text('Light Theme', style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor)),
                  Spacer(),
                  Switch(
                    value: themeController.isDarkTheme.value,
                    onChanged: (value) {
                      themeController.toggleTheme();
                    },
                  ),
                  Text('Dark Theme', style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
