import 'package:carsave/Controller/data_controller.dart';
import 'package:carsave/Routes/routes.dart';
import 'package:carsave/Utils/Widgets/home_bottom_container.dart';
import 'package:carsave/Utils/Widgets/home_top_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../Utils/const.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeScale = screenWidth / 375;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Image.asset('assets/images/logo.png', height: 40),
            CircleAvatar(
              backgroundColor: Theme.of(context).indicatorColor,
              radius: 25*fontSizeScale,
              child: Image.asset(logo),
            ),
            IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: Theme.of(context).primaryColor,
                size: 45*fontSizeScale,
              ),
              onPressed: () {
                Get.toNamed(RoutesPath.userProfile);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Skeletonizer(
          enabled: dataController.isLoading.value,
          enableSwitchAnimation: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopContainer(dataController: dataController),
              const SizedBox(height: 30),
              HomeBottomContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

