import 'package:bloodbank_management/models/user_model.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  String verificationId = '';

  UserModel user = UserModel(
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
      contact: '',
      canDonate: false);
}
