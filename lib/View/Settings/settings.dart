import 'package:carsave/Controller/data_controller.dart';
import 'package:carsave/Routes/routes.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Privacy_and_Policy/privacy_and_policy.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key, required this.dataController});
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.settings,size: 90,),
              SizedBox(width: kDefaultPadding-5),
              Text('Setting',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)
            ],
          ),
          SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding*1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Biometrics Login',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                      ),
                      Spacer(),
                      Obx(() => Switch(
                        value: dataController.fingerStatus.value, // Bind switch value to observable
                        onChanged: (newValue) {
                          dataController.fingerPrintStatus(newValue); // Call the function to update
                        },
                        activeTrackColor: kBlackColor,
                      )),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: (){
                      Get.toNamed(RoutesPath.theme);
                    },
                    child: Text('Change Theme',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)),
                TextButton(
                    onPressed: (){
                      Get.snackbar('Version', '1.0.0.1',snackPosition: SnackPosition.BOTTOM,margin: EdgeInsets.all(16),backgroundColor: kBoxColor);
                    },
                    child: Text('Version',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)),
                TextButton(
                    onPressed: (){
                      Get.to(()=> PrivacyAndPolicyPage(),transition: Transition.rightToLeft);
                    },
                    child: Text('Privacy Police',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)),
                TextButton(
                    onPressed: (){
                      Get.toNamed(RoutesPath.termPage);
                    },
                    child: Text('Terms of Service',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)),
                TextButton(
                    onPressed: (){
                      Get.toNamed(RoutesPath.licensesPage);
                    },
                    child: Text('Licenses',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)),
                TextButton(
                    onPressed: (){
                      Get.toNamed(RoutesPath.setTargetAmount);
                    },
                    child: Text('Set Target Amount',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)),

              ],
            ),
          )

        ],
      ),
    );
  }
}