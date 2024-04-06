import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  late var userData;

  Future<dynamic> fetchUserDetails(String? email) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('user');
    final usersdocSnapshot = await users.where('email', isEqualTo: email).get();

    final CollectionReference lawyers =
        FirebaseFirestore.instance.collection('lawyer');
    final lawyerdocSnapshot =
        await lawyers.where('email', isEqualTo: email).get();

    if (usersdocSnapshot.docs.isNotEmpty) {
      final userDoc = usersdocSnapshot.docs.first;
      userData = userDoc.data(); // Contains user data
      return userData;
    } else {
      final userDoc = lawyerdocSnapshot.docs.first;
      userData = userDoc.data(); // Contains user data
      return userData;
    }
  }
}
