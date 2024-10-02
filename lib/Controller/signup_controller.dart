import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/user_model.dart';
import '../Routes/routes.dart';

class SignupController extends GetxController {
  // Fire store instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //model
  var userModel = UserModel().obs;
  RxBool isLoading = false.obs;

  final nameController = TextEditingController().obs;
  final idController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  Future<UserModel?> signUp(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        // Create a UserModel object
        userModel.value = UserModel(
          name: nameController.value.text,
          address: addressController.value.text,
          phone: phoneController.value.text,
          id: idController.value.text,
          email: email,
          password: password,
          balance: 0,
          target: 0,
          profileImage: '',
          totalSaving: 0,
          lastUpdate: Timestamp.now(),
          fingerPrint: false,
        );

        await _firestore.collection('users').doc(user.uid).set({
          'name': userModel.value.name,
          'phone': userModel.value.phone,
          'id': userModel.value.id,
          'email': userModel.value.email,
          'password': userModel.value.password,
          'balance': userModel.value.balance,
          'target': userModel.value.target,
          'address': userModel.value.address,
          'uid': user.uid,
          'profileImage': userModel.value.profileImage,
          'totalSaving': userModel.value.totalSaving,
          'lastUpdate': userModel.value.lastUpdate,
          'fingerPrint': userModel.value.fingerPrint,
        });
        isLoading.value = false;
        // Success message
        Get.snackbar('Registration Successful', 'Welcome to CAR SAVE');
        Get.toNamed(RoutesPath.home);
        return userModel.value;
      } else {
        isLoading.value = false;
        Get.snackbar('Registration Failed!', 'Try again!');
        if (kDebugMode) {
          print("User is null");
        }
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Error in registering: $e");
      }
      Get.snackbar('Error', 'Registration failed: $e');
      return null;
    }
  }
}
