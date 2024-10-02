import 'package:carsave/Routes/routes.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Model/user_model.dart';

class LoginController extends GetxController{
  // Fire store instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //model
  var userModel = UserModel().obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  RxBool isLoading = false.obs;


  Future<UserModel?> login(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;

      if (user != null) {
        // Fetch additional user details from Firestore
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (documentSnapshot.exists) {
          // Populate userModel with additional fields from Firestore
          userModel.value = UserModel(
            uid: user.uid,
            name: documentSnapshot.get('name') ?? user.displayName ?? '',
            phone: documentSnapshot.get('phone') ?? user.phoneNumber ?? '',
            email: email,
            id: documentSnapshot.get('id') ?? '',
            balance: documentSnapshot.get('balance') ?? '',
            target: documentSnapshot.get('target') ?? '',
            address: documentSnapshot.get('address') ?? '',
            profileImage: user.photoURL ?? documentSnapshot.get('profileImage') ?? '',
            password: password,
          );
          // Clear the text fields after successful login
          clearFields();
          isLoading.value = false;
          Get.snackbar('Login Successful', 'Welcome to CAR SAVE');
          Get.offAllNamed(RoutesPath.home);
          return userModel.value;
        } else {
          isLoading.value = false;
          Get.snackbar('Login Fail!', 'User data not found!', backgroundColor: kRedColor, colorText: kBackgroundColor);
          return null;
        }
      } else {
        isLoading.value = false;
        Get.snackbar('Login Fail!', 'Try Again!', backgroundColor: kRedColor, colorText: kBackgroundColor);
        return null;
      }

    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        Get.snackbar('Login Fail!', 'Check your email and password!', backgroundColor: kRedColor, colorText: kBackgroundColor);
        print("Error in login: $e");
      }
      return null;
    }
    return null;
  }

  void clearFields() {
    emailController.value.clear();
    passwordController.value.clear();
  }
}