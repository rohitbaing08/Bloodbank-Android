import 'package:bloodbank_management/models/user_model.dart';
import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController localityController = TextEditingController();
    TextEditingController bloodgroupController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController adhaarController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
              Consumer<AuthViewModel>(
                builder: (context, value, child) => TextButton(
                  onPressed: () {
                    value.user = UserModel(
                        name: nameController.text,
                        address: addressController.text,
                        locality: localityController.text,
                        age: ageController.text.toString(),
                        bloodgroup: bloodgroupController.text,
                        adhaarNo: adhaarController.text,
                        email: value.user.email.toString(),
                        username: value.user.username,
                        password: value.user.password,
                        id: '',
                        contact: contactController.text,
                        canDonate: false);
                    router.push('/otp-verification');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
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
                        'Submit',
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
    );
  }
}
