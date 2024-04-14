import 'package:bloodbank_management/models/bloodbank_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BloodbankViewModel extends ChangeNotifier {
  Future<dynamic> fetchBloodbanks() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('bloodbanks').get();
      List<BloodbankModel> bloodbanks = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return BloodbankModel.fromJson(data);
      }).toList();

      return bloodbanks;
    } catch (e) {
      print('Error fetching bloodbanks: $e');
      return []; // Return an empty list if there's an error
    }
  }
}
