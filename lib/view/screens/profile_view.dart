import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Icons.logout_outlined,
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
                        'assets/Images/profilepic.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Add your onPressed logic here
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: LightAppColors().seedColor,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              const Text(
                'Jay Ghodvinde',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 2),
              const Text(
                'jayghodvinde@gmail.com',
                style: TextStyle(
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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Jay Ghodvinde',
                              style: TextStyle(
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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '+91 9321279994',
                              style: TextStyle(
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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'jayghodvinde@gmail.com',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
