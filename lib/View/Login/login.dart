import 'package:carsave/Controller/login_controller.dart';
import 'package:carsave/Utils/Widgets/custom_button.dart';
import 'package:carsave/Utils/Widgets/login_and_signup_top.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../Routes/routes.dart';
import '../../Utils/Widgets/custom_text_button.dart';
import '../../Utils/Widgets/input_form_field.dart';
import '../../Utils/const.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoginTopContainer(),
                // Email Input Field
                Obx(()=>Skeletonizer(
                  enabled: loginController.isLoading.value,
                  enableSwitchAnimation: true,
                  child: Column(
                    children: [
                      InputFormField(
                        title: 'EMAIL ID',
                        icon: Icons.person,
                        controller: loginController.emailController.value,
                      ),
                      sizeBox,
                      InputFormField(
                        title: 'PHONE NUMBERS',
                        icon: Icons.call,
                        controller: loginController.phoneController.value,
                      ),
                      sizeBox,
                      InputFormField(
                        title: 'PASSWORD',
                        icon: Icons.lock_open_rounded,
                        controller: loginController.passwordController.value,
                      ),
                      // Login Button
                      CustomButton(
                        onPress: () {
                          String email = loginController.emailController.value.text;
                          String password = loginController.passwordController.value.text;
                          loginController.login(email, password);
                        },
                        title: 'LOGIN',
                      ),
                      CustomTextButton(
                        onPress: () {
                          Get.offAllNamed(RoutesPath.signup);
                        },
                        title: 'REGISTER HERE!',
                      ),
                    ],
                  ),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
