import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? id;
  final String? phone;
  final String? address;
  final int? target;
  final int? balance;
  final int? totalSaving;
  final String? email;
  final String? password;
  final String? profileImage;
  final String? uid;
  final Timestamp? lastUpdate;
  final bool? fingerPrint;

  UserModel({
    this.name,
    this.id,
    this.phone,
    this.address,
    this.target,
    this.balance,
    this.email,
    this.password,
    this.profileImage,
    this.uid,
    this.lastUpdate,
    this.totalSaving,
    this.fingerPrint,
  });

  // Factory method to convert Firestore snapshot to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot['name'],
      email: snapshot['email'],
      phone: snapshot['phone'],
      id: snapshot['id'],
      target: snapshot['target'],
      balance: snapshot['balance'],
      uid: snapshot['uid'],
      address: snapshot['address'],
      password: snapshot['password'],
      profileImage: snapshot['profileImage'],
      lastUpdate: snapshot['lastUpdate'],
      totalSaving: snapshot['totalSaving'],
      fingerPrint: snapshot['fingerPrint'],
    );
  }

  // Method to convert UserModel to Firestore data
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'id': id,
      'target': target,
      'balance': balance,
      'uid': uid,
      'address': address,
      'password': password,
      'profileImage': profileImage,
      'lastUpdate': lastUpdate,
      'totalSaving': totalSaving,
      'fingerPrint': fingerPrint,
    };
  }
}
