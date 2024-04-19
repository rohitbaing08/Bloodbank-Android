import 'package:bloodbank_management/models/user_model.dart';
import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/view_model/home_view_model.dart';
import 'package:bloodbank_management/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RequestForm extends StatefulWidget {
  final UserModel user;
  const RequestForm({super.key, required this.user});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController bloodgroupController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController adhaarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    ageController.text = widget.user.age.toString();
    addressController.text = widget.user.address;
    localityController.text = widget.user.locality;
    bloodgroupController.text = widget.user.bloodgroup;
    contactController.text = widget.user.contact;
    adhaarController.text = widget.user.adhaarNo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, val, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter the Required Details',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 40,
                    color: LightAppColors().seedColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter name',
                    label: Text(
                      'Name',
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(124, 124, 124, 0), width: 0.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    hintText: 'Enter address',
                    label: Text(
                      'Address',
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(124, 124, 124, 0), width: 0.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: contactController,
                  readOnly: true,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Enter mobile number',
                    label: Text(
                      'Mobile number',
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(124, 124, 124, 0), width: 0.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: adhaarController,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter Adhaar number',
                    label: Text(
                      'Adhaar number',
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(124, 124, 124, 0), width: 0.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      child: TextFormField(
                        controller: bloodgroupController,
                        decoration: const InputDecoration(
                          hintText: 'Blood group',
                          label: Text(
                            'Blood group',
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(124, 124, 124, 0),
                                width: 0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter age',
                          label: Text(
                            'Age',
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(124, 124, 124, 0),
                                width: 0.5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: localityController,
                  decoration: const InputDecoration(
                    hintText: 'Enter locality',
                    label: Text(
                      'Locality',
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(124, 124, 124, 0), width: 0.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Consumer<UserViewModel>(
                  builder: (context, value, child) => TextButton(
                    onPressed: () {
                      UserModel user = UserModel(
                          name: nameController.text,
                          address: addressController.text,
                          locality: localityController.text,
                          age: ageController.text.toString(),
                          bloodgroup: bloodgroupController.text,
                          adhaarNo: adhaarController.text,
                          email: val.currentUser.email.toString(),
                          username: val.currentUser.username,
                          password: 'password',
                          id: val.currentUser.id,
                          contact: contactController.text,
                          canDonate: val.currentUser.canDonate);
                      value.addReceiver(user);
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: 'Request sent successfully!!');
                    },
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: LightAppColors().seedColor,
                      ),
                      height: 60,
                      width: 170,
                      child: const Center(
                        child: Text(
                          'Request',
                          style: TextStyle(
                              color: Color.fromRGBO(244, 244, 244, 1),
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
