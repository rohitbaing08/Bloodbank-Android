import 'package:bloodbank_management/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> bloodgroupsList1 = [];
  List<String> locationList1 = [];

  List<String> bloodgroupsList2 = [];
  List<String> locationList2 = [];

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
      users.forEach((element) {
        locationList2.add(element.locality);
        bloodgroupsList2.add(element.bloodgroup);
        // To delete double values
        locationList2 = locationList2.toSet().toList();
        bloodgroupsList2 = bloodgroupsList1.toSet().toList();
        print(locationList2 + bloodgroupsList2);
      });
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
      users.forEach((element) {
        locationList1.add(element.locality);
        bloodgroupsList1.add(element.bloodgroup);
        // To delete double values
        locationList1 = locationList1.toSet().toList();
        bloodgroupsList1 = bloodgroupsList1.toSet().toList();
        print(locationList1 + bloodgroupsList1);
      });
      return users;
    } catch (e) {
      print('Error fetching users: $e');
      return []; // Return an empty list if there's an error
    }
  }
}
