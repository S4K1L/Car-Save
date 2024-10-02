import 'package:carsave/Controller/data_controller.dart';
import 'package:carsave/Utils/Widgets/form_data_container.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key, required this.dataController});
  final DataController dataController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_sharp,size: 90,),
              Text('My Account',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)
            ],
          ),
          SizedBox(height: kDefaultPadding),
          FormDataContainer(title: 'FULL NAME', data: dataController.userModel.value.name ?? 'Loading',),
          FormDataContainer(title: 'ID NUMBER', data: dataController.userModel.value.id ?? 'Loading',),
          FormDataContainer(title: 'E-MAIL ID', data: dataController.userModel.value.email ?? 'Loading',),
          FormDataContainer(title: 'ADDRESS', data: dataController.userModel.value.address ?? 'Loading',),
        ],
      ),
    );
  }
}