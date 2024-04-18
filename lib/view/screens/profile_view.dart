import 'package:bloodbank_management/models/user_model.dart';
import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view_model/home_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut().then((value) async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('isLoggedIn', false);
                        Fluttertoast.showToast(msg: 'Logout successfully!!');
                        router.go('/register');
                      });
                    },
                    icon: const Icon(
                      Icons.logout_sharp,
                      color: Colors.black,
                      size: 40,
                    )),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.asset(
                          'assets/Images/profilepic.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  value.currentUser.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  value.currentUser.email,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Color(0xFF3B495A),
                  thickness: 2,
                  height: 20, // Adjust the height of the divider as needed
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Set the background color of the circular container to white
                              border: Border.all(
                                color: Colors.black.withOpacity(0.4),
                                // Set the color of the border
                                width: 2, // Set the width of the border
                              ),
                            ),
                            child: const Icon(
                              Icons.person_outline_rounded,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                value.currentUser.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Set the background color of the circular container to white
                              border: Border.all(
                                color: Colors.black.withOpacity(0.4),
                                // Set the color of the border
                                width: 2, // Set the width of the border
                              ),
                            ),
                            child: const Icon(
                              Icons.phone,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Contact',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                value.currentUser.contact,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Set the background color of the circular container to white
                              border: Border.all(
                                color: Colors.black.withOpacity(0.4),
                                // Set the color of the border
                                width: 2, // Set the width of the border
                              ),
                            ),
                            child: const Icon(
                              Icons.mail_outlined,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                value.currentUser.email,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Set the background color of the circular container to white
                              border: Border.all(
                                color: Colors.black.withOpacity(0.4),
                                // Set the color of the border
                                width: 2, // Set the width of the border
                              ),
                            ),
                            child: const Icon(
                              Icons.water_drop_outlined,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Can Donate blood?',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('users')
                                        .where('email',
                                            isEqualTo: value.currentUser.email)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null) {
                                        print(snapshot.data);
                                        return CupertinoSwitch(
                                            activeColor:
                                                LightAppColors().seedColor,
                                            value: value.currentUser.canDonate,
                                            onChanged: (val) {
                                              value.disableDonation(
                                                  value.currentUser.id, val);
                                              value.currentUser = UserModel(
                                                  name: value.currentUser.name,
                                                  address:
                                                      value.currentUser.address,
                                                  locality: value
                                                      .currentUser.locality,
                                                  age: value.currentUser.age,
                                                  bloodgroup: value
                                                      .currentUser.bloodgroup,
                                                  adhaarNo: value
                                                      .currentUser.adhaarNo,
                                                  email:
                                                      value.currentUser.email,
                                                  username: value
                                                      .currentUser.username,
                                                  password: value
                                                      .currentUser.password,
                                                  id: value.currentUser.id,
                                                  contact:
                                                      value.currentUser.contact,
                                                  canDonate: val);
                                            });
                                      } else {
                                        return Container();
                                      }
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
