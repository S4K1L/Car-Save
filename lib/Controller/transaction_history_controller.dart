import 'package:carsave/Model/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TransactionHistoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var transactionsList = <TransactionModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTransactionHistory();
  }
  getTransactionHistory() async {
    isLoading.value = true;
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        _firestore
            .collection('savings')
            .where('uid', isEqualTo: user.uid)
            .orderBy('date', descending: true)
            .snapshots()
            .listen((querySnapshot) {
          transactionsList.clear();
          for (var doc in querySnapshot.docs) {
            transactionsList.add(TransactionModel.fromSnapshot(doc));
          }
          isLoading.value = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching transactions: $e");
      }
      isLoading.value = false;
    }
  }

}
