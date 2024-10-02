import 'package:carsave/Controller/signup_controller.dart';
import 'package:carsave/Routes/routes.dart';
import 'package:carsave/Utils/Widgets/custom_button.dart';
import 'package:carsave/Utils/Widgets/login_and_signup_top.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../Utils/Widgets/custom_text_button.dart';
import '../../Utils/Widgets/input_form_field.dart';
import '../../Utils/colors.dart';
import '../../Utils/const.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor, // Background color
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoginTopContainer(),
                // Email Input Field
                Obx(()=> Skeletonizer(
                  enabled: signupController.isLoading.value,
                  enableSwitchAnimation: true,
                  child: Column(
                    children: [
                      InputFormField(
                        title: 'FULL NAME',
                        icon: Icons.drive_file_rename_outline,
                        controller: signupController.nameController.value,
                      ),
                      sizeBox,
                      InputFormField(
                        title: 'ID NUMBER',
                        icon: Icons.abc,
                        controller: signupController.idController.value,
                      ),
                      sizeBox,
                      InputFormField(
                        title: 'PHONE NUMBERS',
                        icon: Icons.call,
                        controller: signupController.phoneController.value,
                      ),
                      sizeBox,
                      InputFormField(
                        title: 'ADDRESS',
                        icon: Icons.location_on_rounded,
                        controller: signupController.addressController.value,
                      ),
                      sizeBox,
                      InputFormField(
                        title: 'E-MAIL ID',
                        icon: Icons.person,
                        controller: signupController.emailController.value,
                      ),
                      sizeBox,
                      InputFormField(
                        title: 'PASSWORD',
                        icon: Icons.lock_open_rounded,
                        controller: signupController.passwordController.value,
                      ),
                      // Login Button
                      CustomButton(onPress: () {
                        String email = signupController.emailController.value.text;
                        String password = signupController.passwordController.value.text;
                        signupController.signUp(email, password);
                      }, title: 'SIGNUP',),
                      // Register Text
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CustomTextButton(onPress: () {
                          Get.offAllNamed(RoutesPath.login);
                        }, title: 'LOGIN HERE!',),
                      ),
                    ],
                  ),
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

