import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetTargetController extends GetxController {
  // Controllers for input fields
  var amountController = TextEditingController().obs;

  // Firestore and FirebaseAuth instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Observables for tracking state
  RxList<bool> monthCompletionStatus = List.generate(12, (_) => false).obs;

  // Add saving and update balance
  Future<void> setTarget() async {
    try {
      User? user = auth.currentUser;
      if (user == null) {
        Get.snackbar("Error", "No user logged in");
        return;
      }

      String uid = user.uid;
      int targetAmount = int.parse(amountController.value.text);
      DateTime currentDate = DateTime.now();

      DocumentReference userDoc = firestore.collection('users').doc(uid);
      DocumentSnapshot userSnapshot = await userDoc.get();

      if (!userSnapshot.exists) {
        Get.snackbar("Error", "User data not found");
        return;
      }

      Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
      if (userData == null) {
        Get.snackbar("Error", "Failed to retrieve user data");
        return;
      }

      // Check if the user already has a target for the current month
      QuerySnapshot targetSnapshot = await firestore.collection('targets')
          .where('uid', isEqualTo: uid)
          .where('date', isGreaterThanOrEqualTo: DateTime(currentDate.year, currentDate.month, 1)) // Start of the current month
          .where('date', isLessThanOrEqualTo: DateTime(currentDate.year, currentDate.month + 1, 0)) // End of the current month
          .get();

      if (targetSnapshot.docs.isNotEmpty) {
        // User already has a target for the current month, update the target amount
        DocumentSnapshot existingTargetDoc = targetSnapshot.docs.first;
        Map<String, dynamic> existingTargetData = existingTargetDoc.data() as Map<String, dynamic>;

        int newTargetAmount = existingTargetData['amount'] + targetAmount;

        // Ensure totalSaving doesn't go below 0
        int totalSaving = (userData['totalSaving'] ?? 0) + targetAmount;
        totalSaving = totalSaving < 0 ? 0 : totalSaving;

        await existingTargetDoc.reference.update({
          'amount': newTargetAmount,
          'date': currentDate,
        });

        await userDoc.update({
          'target': newTargetAmount,
          'totalSaving': totalSaving,
          'lastUpdate': currentDate,
        });

        Get.snackbar("Success", "Target updated successfully for this month");
      } else {
        // No target for this month, create a new target document
        await firestore.collection('targets').add({
          'uid': uid,
          'amount': targetAmount,
          'savedAmount': userData['target'],
          'date': currentDate,
        });

        // Ensure balance and totalSaving don't go below 0
        int tempAmount = (userData['balance'] ?? 0) - userData['target'];
        tempAmount = tempAmount < 0 ? 0 : tempAmount;

        int totalSaving = (userData['totalSaving'] ?? 0) + targetAmount;
        totalSaving = totalSaving < 0 ? 0 : totalSaving;

        await userDoc.update({
          'target': targetAmount,
          'balance': tempAmount,
          'totalSaving': totalSaving,
          'lastUpdate': currentDate,
        });

        Get.snackbar("Success", "Target set successfully for the new month");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Fetches and updates the completion status for each month
  Future<void> fetchTargetCompletionStatus() async {
    try {
      User? user = auth.currentUser;
      if (user == null) {
        Get.snackbar("Error", "No user logged in");
        return;
      }

      String uid = user.uid;

      // Get the user's balance and target
      DocumentSnapshot userSnapshot = await firestore.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        // Fetch all target data for the logged-in user
        QuerySnapshot targetSnapshot = await firestore
            .collection('targets')
            .where('uid', isEqualTo: uid)
            .get();

        // Initialize tempCompletionStatus for 12 months
        List<bool> tempCompletionStatus = List.generate(12, (_) => false);

        // Iterate through the target documents and update the completion status
        targetSnapshot.docs.forEach((doc) {
          int targetAmount = doc['amount'];
          int savedAmount = userSnapshot['balance'] ?? 0; // Assuming saved amount is stored as 'target' in the user data
          DateTime targetDate = (doc['date'] as Timestamp).toDate();
          int monthIndex = targetDate.month - 1; // Get the month (0-based index)

          // Check if savedAmount is greater than or equal to the target amount for each month
          if (savedAmount >= targetAmount) {
            tempCompletionStatus[monthIndex] = true; // Mark month as completed
          } else {
            tempCompletionStatus[monthIndex] = false; // Mark month as not completed
          }
        });

        // Update the observable monthCompletionStatus with the calculated values
        monthCompletionStatus.value = tempCompletionStatus;
      } else {
        Get.snackbar("Error", "User data not found");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
