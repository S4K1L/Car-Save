import 'package:carsave/Controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({
    super.key,
    required this.dataController,
  });

  final DataController dataController;

  @override
  Widget build(BuildContext context) {
    // Get the screen width to scale the font size
    double screenWidth = MediaQuery.of(context).size.width;

    // Scale factor for font size, adjust as needed
    double fontSizeScale = screenWidth / 375;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Obx(
            () => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            dataController.userModel.value.profileImage != null
                ? CircleAvatar(
              radius: 40 * fontSizeScale,
              backgroundImage: NetworkImage(
                  dataController.userModel.value.profileImage!),
            )
                : CircleAvatar(
              radius: 40 * fontSizeScale,
              child: const Icon(Icons.person, size: 40),
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataController.userModel.value.name ?? 'Loading',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18 * fontSizeScale, // Dynamic font size
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  dataController.userModel.value.email ?? 'Loading',
                  style: TextStyle(
                    fontSize: 16 * fontSizeScale, // Dynamic font size
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
