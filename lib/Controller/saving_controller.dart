import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavingController extends GetxController {
  // Controllers for input fields
  var amountController = TextEditingController().obs;

  // Firestore and FirebaseAuth instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Add saving and update balance
  Future<void> addSaving(String paymentMethod) async {
    try {
      // Get current user
      User? user = auth.currentUser;
      if (user == null) {
        Get.snackbar("Error", "No user logged in");
        return;
      }

      String uid = user.uid;
      int savingAmount = int.parse(amountController.value.text);  // Change to int
      DateTime currentDate = DateTime.now();

      // Reference to the user's document in Firestore
      DocumentReference userDoc = firestore.collection('users').doc(uid);

      // Get the current balance and previous saving data
      DocumentSnapshot userSnapshot = await userDoc.get();
      if (!userSnapshot.exists) {
        Get.snackbar("Error", "User data not found");
        return;
      }

      // Cast user data to Map<String, dynamic>
      Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

      if (userData == null) {
        Get.snackbar("Error", "Failed to retrieve user data");
        return;
      }

      // Extract previous balance as an integer
      int previousBalance = userData['balance']?.toInt() ?? 0;

      // Update the new balance
      int newBalance = previousBalance + savingAmount;

      // Save new saving data in 'savings' collection
      await firestore.collection('savings').add({
        'uid': uid,
        'amount': savingAmount,
        'paymentMethod': paymentMethod,
        'date': currentDate,
      });

      // Update the user's balance and last update date
      await userDoc.update({
        'balance': newBalance,
        'lastUpdate': currentDate,
      });

      Get.snackbar("Success", "Saving added and balance updated successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
