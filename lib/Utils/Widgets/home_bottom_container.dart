import 'package:carsave/Controller/data_controller.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/View/Saving_Page/saving_page.dart';
import 'package:carsave/View/Target_Saving/target_saving.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeBottomContainer extends StatefulWidget {
  HomeBottomContainer({
    super.key,
  });

  @override
  State<HomeBottomContainer> createState() => _HomeBottomContainerState();
}

class _HomeBottomContainerState extends State<HomeBottomContainer> {
  final DataController dataController = Get.put(DataController());
  final Timestamp? date = Timestamp.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 120),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: kBoxColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'SAVINGS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            Text(
                              'Smart Saving is on',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            SizedBox(height: 10),
                            // Using Obx for reactive data update
                            Obx(() => Skeletonizer(
                                  enabled: dataController.isLoading.value,
                                  enableSwitchAnimation: true,
                                  child: Text(
                                    'RM ${dataController.userModel.value.balance ?? 0}',
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 80,
                top: 60,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => SavingsPage(
                            totalSaving:
                                dataController.userModel.value.balance ?? 0,
                            lastUpdate:
                                dataController.userModel.value.lastUpdate ?? date,
                          ),
                      transition: Transition.leftToRight
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).cardColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          // Target Savings Container
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: kBoxColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'TARGET SAVING',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Your Target Around the Corner',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            SizedBox(height: 10),
                            // Using Obx for reactive data update
                            Obx(() => Skeletonizer(
                                  enabled: dataController.isLoading.value,
                                  enableSwitchAnimation: true,
                                  child: Text(
                                    'RM ${dataController.userModel.value.target ?? 0}',
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 60,
                top: 60,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {
                      // Add your onPressed logic for the check button
                      Get.to(
                          () => TargetPage(
                                targetSaving:
                                    dataController.userModel.value.target ?? 0,
                                lastUpdate:
                                    dataController.userModel.value.lastUpdate ?? date,
                              ),
                          transition: Transition.rightToLeft);
                    },
                    icon: Icon(
                      Icons.check,
                      color: Theme.of(context).cardColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
