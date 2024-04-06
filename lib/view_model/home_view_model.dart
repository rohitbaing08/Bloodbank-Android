import 'package:bloodbank_management/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  late var userData;
  UserModel currentUser = UserModel(
      name: '',
      address: '',
      locality: '',
      age: '',
      bloodgroup: '',
      adhaarNo: '',
      email: '',
      username: '',
      password: '',
      id: '',
      contact: '');

  Future<dynamic> fetchUserDetails(String? email) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final usersdocSnapshot = await users.where('email', isEqualTo: email).get();

    if (usersdocSnapshot.docs.isNotEmpty) {
      final userDoc = usersdocSnapshot.docs.first;
      userData = userDoc.data();
      currentUser = UserModel.fromJson(userData); // Contains user data
    }
  }
}
