import 'package:bloodbank_management/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  updateList() {
    notifyListeners();
  }

  Future<dynamic> fetchDonors() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('canDonate', isEqualTo: true)
          .get();
      List<UserModel> users = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return UserModel.fromJson(data);
      }).toList();
      return users;
    } catch (e) {
      print('Error fetching users: $e');
      return []; // Return an empty list if there's an error
    }
  }

  Future<dynamic> fetchReceivers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();
      List<UserModel> users = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return UserModel.fromJson(data);
      }).toList();
      return users;
    } catch (e) {
      print('Error fetching users: $e');
      return []; // Return an empty list if there's an error
    }
  }
}
