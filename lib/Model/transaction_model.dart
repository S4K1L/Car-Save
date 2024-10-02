import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel{
  final Timestamp? date;
  final int? amount;
  final String? paymentMethod;

  TransactionModel({
    this.date,
    this.amount,
    this.paymentMethod
});

  // Factory method to convert Firestore snapshot to UserModel
  factory TransactionModel.fromSnapshot(DocumentSnapshot snapshot) {
    return TransactionModel(
      amount: snapshot['amount'],
      date: snapshot['date'],
      paymentMethod: snapshot['paymentMethod'],
    );
  }

  // Method to convert UserModel to Firestore data
  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'date': date,
      'paymentMethod': paymentMethod,
    };
  }
}