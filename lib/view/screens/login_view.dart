import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hopefully',
                style: TextStyle(
                  fontSize: 65,
                  color: LightAppColors().seedColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter email',
                  label: Text(
                    'Email',
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
                height: 30,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter password',
                  label: Text(
                    'Password',
                    style: TextStyle(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(124, 124, 124, 0), width: 0.5),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(124, 124, 124, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((value) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('isLoggedIn', true);
                      Fluttertoast.showToast(msg: 'Login successful!!');
                      router.go('/bottom-nav');
                    });
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: 'Login unsuccessful!!\nPlease try again');
                  }
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
                      'Log In',
                      style: TextStyle(
                          color: Color.fromRGBO(244, 244, 244, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Don’t you have an account? ',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(124, 124, 124, 1),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/register');
                            },
                          style: TextStyle(
                              fontSize: 18, color: LightAppColors().seedColor),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
