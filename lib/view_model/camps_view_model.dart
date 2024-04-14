import 'package:bloodbank_management/models/camp_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CampsViewModel extends ChangeNotifier {
  Future<dynamic> fetchCamps() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('camps').get();
      List<CampModel> camps = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return CampModel.fromJson(data);
      }).toList();

      return camps;
    } catch (e) {
      print('Error fetching camps: $e');
      return []; // Return an empty list if there's an error
    }
  }
}
