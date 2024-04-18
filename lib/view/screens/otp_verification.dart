import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OTPVerificationView extends StatelessWidget {
  const OTPVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pin1 = TextEditingController();
    TextEditingController pin2 = TextEditingController();
    TextEditingController pin3 = TextEditingController();
    TextEditingController pin4 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, value, child) => Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: LightAppColors().seedColor,
              child: const Center(
                child: Text(
                  'OTP Verification',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Please Enter the OTP',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Enter OTP sent to +91 ${value.user.contact}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: TextFormField(
                              controller: pin1,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(124, 124, 124, 0),
                                      width: 0.5),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: TextFormField(
                              controller: pin2,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(124, 124, 124, 0),
                                      width: 0.5),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: TextFormField(
                              controller: pin3,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(124, 124, 124, 0),
                                      width: 0.5),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: TextFormField(
                              controller: pin4,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(124, 124, 124, 0),
                                      width: 0.5),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () async {
                        print(pin1.text + pin2.text + pin3.text + pin4.text);
                        // try {
                        //   await FirebaseAuth.instance
                        //       .createUserWithEmailAndPassword(
                        //           email: value.user.email,
                        //           password: value.user.password)
                        //       .then((val) {
                        //     UserModel dataToSave = UserModel(
                        //         name: value.user.name,
                        //         address: value.user.address,
                        //         locality: value.user.locality,
                        //         age: value.user.age,
                        //         bloodgroup: value.user.bloodgroup,
                        //         adhaarNo: value.user.adhaarNo,
                        //         email: value.user.email,
                        //         username: value.user.username,
                        //         password: value.user.password,
                        //         id: val.user!.uid,
                        //         contact: value.user.contact,
                        //         canDonate: false);
                        //     FirebaseFirestore.instance
                        //         .collection('/users')
                        //         .add(dataToSave.toJson());
                        //   }).then((value) async {
                        //     SharedPreferences prefs =
                        //         await SharedPreferences.getInstance();
                        //     prefs.setBool('isLoggedIn', true);
                        //     Fluttertoast.showToast(
                        //         msg: 'User registered successfully!!');
                        //     router.go('/bottom-nav');
                        //   });
                        // } catch (e) {
                        //   print(e);
                        //   Fluttertoast.showToast(
                        //       msg: 'Registration unsuccessful!!\nTry again.');
                        // }
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
                            'Submit',
                            style: TextStyle(
                                color: Color.fromRGBO(244, 244, 244, 1),
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
