import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view/screens/request_blood_view.dart';
import 'package:bloodbank_management/view_model/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => Scaffold(
          body: FutureBuilder(
        future:
            value.fetchUserDetails(FirebaseAuth.instance.currentUser!.email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitSpinningLines(color: LightAppColors().seedColor),
            );
          } else {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: SizedBox(
                    child: Image.asset('assets/Images/appbar.png'),
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${'Welcome ${value.currentUser.name.split(' ')[0]}'} 👋',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Conquer the world by saving \nthe lives of other',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Center(
                          child: SizedBox(
                            height: 400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            router.push('/receivers-list');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: LightAppColors()
                                                        .seedColor),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 140,
                                            width: 140,
                                            child: Image.asset(
                                                'assets/Images/Donate.png'),
                                          ),
                                        ),
                                        const Text(
                                          'Donate blood',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            router.push('/donors-list');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: LightAppColors()
                                                        .seedColor),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 140,
                                            width: 140,
                                            child: Image.asset(
                                                'assets/Images/Receive.png'),
                                          ),
                                        ),
                                        const Text(
                                          'Receive blood',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RequestForm(
                                                    user: value.currentUser,
                                                  ),
                                                ));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: LightAppColors()
                                                        .seedColor),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 140,
                                            width: 140,
                                            child: Image.asset(
                                                'assets/Images/Request.png'),
                                          ),
                                        ),
                                        const Text(
                                          'Request blood',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            router.push('/bloodbanks-list');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: LightAppColors()
                                                        .seedColor),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 140,
                                            width: 140,
                                            child: Image.asset(
                                                'assets/Images/Hospital.png'),
                                          ),
                                        ),
                                        const Text(
                                          'Bloodbanks',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }
        },
      )),
    );
  }
}
