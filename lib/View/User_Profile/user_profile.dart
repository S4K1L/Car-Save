import 'package:carsave/Routes/routes.dart';
import 'package:carsave/Utils/Widgets/custom_appbar.dart';
import 'package:carsave/Utils/Widgets/custom_profile_button.dart';
import 'package:carsave/Utils/Widgets/custom_text_button.dart';
import 'package:carsave/Utils/Widgets/user_data.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/View/My_Account/my_account.dart';
import 'package:carsave/View/Settings/settings.dart';
import 'package:carsave/View/Transaction_History/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/data_controller.dart';
import '../../Utils/const.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    // Get the screen width to scale the font size
    double screenWidth = MediaQuery.of(context).size.width;

    // Scale factor for font size, adjust as needed
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
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                color: Theme.of(context).primaryColor,
                size: 50*fontSizeScale,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: Theme.of(context).indicatorColor,
              radius: 25*fontSizeScale,
              child: Image.asset(logo),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserData(dataController: dataController),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 3.5,
                  vertical: kDefaultPadding * 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomProfileButton(
                    onPress: () {
                      Get.toNamed(RoutesPath.home);
                    },
                    title: 'Home',
                    icon: Icons.home_rounded,
                  ),
                  const SizedBox(height: 20),
                  CustomProfileIconButton(
                    onPress: () {
                      Get.to(() => MyAccount(dataController: dataController),
                          transition: Transition.rightToLeft);
                    },
                    title: 'My Account',
                    icon: Icons.person_sharp,
                  ),
                  const SizedBox(height: 20),
                  CustomProfileIconButton(
                    onPress: () {
                      Get.to(
                        () => SettingPage(
                          dataController: dataController,
                        ),
                        transition: Transition.rightToLeft,
                      );
                    },
                    title: 'Setting',
                    icon: Icons.settings,
                  ),
                  const SizedBox(height: 20),
                  CustomProfileIconButton(
                    onPress: () {
                      Get.toNamed(RoutesPath.notificationPage);
                    },
                    title: 'Notification',
                    icon: Icons.notifications,
                  ),
                  const SizedBox(height: 20),
                  CustomProfileIconButton(
                    onPress: () {
                      Get.to(
                        () => TransactionHistory(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    title: 'Transaction\nHistory',
                    icon: Icons.receipt_long_outlined,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomTextButton(onPress: () {
                      dataController.logout();
                    }, title: 'LOGOUT',),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
