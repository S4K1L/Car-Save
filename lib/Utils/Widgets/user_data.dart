import 'package:carsave/Controller/data_controller.dart';
import 'package:carsave/Utils/Widgets/profile_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
    required this.dataController,
  });

  final DataController dataController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          dataController.userModel.value.profileImage != null
              ? ProfileImagePicker()
              : CircleAvatar(
            radius: 45,
            child: Icon(Icons.person, size: 40),
          ),
          SizedBox(width: 30),
          Obx(
                () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataController.userModel.value.name ?? 'Loading',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  dataController.userModel.value.phone ?? 'Loading',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}