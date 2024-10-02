import 'package:carsave/Controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_image_picker.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({
    super.key,
    required this.dataController,
  });

  final DataController dataController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      child: Obx(()=> Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          dataController.userModel.value.profileImage != null ?
          //ProfileImagePicker()
        CircleAvatar(
        radius: 45,
        backgroundImage: NetworkImage(dataController.userModel.value.profileImage!),
      )
              : CircleAvatar(
            radius: 45,
            child: Icon(Icons.person, size: 40),
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataController.userModel.value.name ?? 'Loading',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.of(context).primaryColor
                ),
              ),
              SizedBox(height: 5),
              Text(
                dataController.userModel.value.email ?? 'Loading',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
                ),
              ),
            ],
          ),
        ],
      ),),
    );
  }
}
