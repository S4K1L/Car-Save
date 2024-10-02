import 'package:carsave/Routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Model/user_model.dart';

class DataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var userModel = UserModel().obs;
  RxBool isLoading = false.obs;
  var fingerStatus = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
    loadFingerStatus();
    isLoading.value = false;
  }

  // Function to toggle and update the fingerprint status
  void fingerPrintStatus(bool newValue) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Update the local observable state
        fingerStatus.value = newValue;

        // Update the Firestore 'fingerPrint' status for the logged-in user
        await _firestore.collection('users').doc(user.uid).update({
          'fingerPrint': newValue,
        });

        Get.snackbar(
          'Success',
          newValue ? 'Fingerprint enabled successfully' : 'Fingerprint disabled',
        );
      } else {
        Get.snackbar('Error', 'No user is logged in');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update fingerprint status: $e');
    }
  }

  // Function to load initial status from Firestore (when the user logs in)
  Future<void> loadFingerStatus() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Fetch the user's document from Firestore
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
          if (userData != null && userData.containsKey('fingerPrint')) {
            fingerStatus.value = userData['fingerPrint']; // Set the initial status
          }
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load fingerprint status: $e');
    }
  }



  // Listen to Firestore document changes in real-time
  void fetchCurrentUser() {
    isLoading.value = true;
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        _firestore.collection('users').doc(user.uid).snapshots().listen((userDoc) {
          if (userDoc.exists) {
            userModel.value = UserModel.fromSnapshot(userDoc);
          }
          isLoading.value = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching current user: $e");
      }
      isLoading.value = false;
    }
  }

  // Update the user balance and last update timestamp
  Future<void> updateBalance(int newSaving) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          int previousBalance = userDoc['balance'] ?? 0;

          int updatedBalance = previousBalance + newSaving;

          await _firestore.collection('users').doc(user.uid).update({
            'balance': updatedBalance,
            'lastUpdate': Timestamp.now(),
          });

          // Since we're using streams, changes will automatically reflect in the UI
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error updating balance: $e");
      }
    }
  }

  // Logout method
  Future<void> logout() async {
    try {
      if (_auth.currentUser != null) {
        await _auth.signOut();
        userModel.value = UserModel();
        Get.offAndToNamed(RoutesPath.login);
      } else {
        if (kDebugMode) {
          print("No user is currently signed in");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error logging out: $e");
      }
      Get.snackbar('Error', 'An error occurred while logging out. Please try again.');
      rethrow;
    }
  }
}
