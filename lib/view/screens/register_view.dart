import 'package:bloodbank_management/models/user_model.dart';
import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view_model/auth_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
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
                height: 80,
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
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Enter username',
                  label: Text(
                    'Username',
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
              const SizedBox(
                height: 70,
              ),
              Consumer<AuthViewModel>(
                builder: (context, value, child) => TextButton(
                  onPressed: () {
                    value.user = UserModel(
                        name: '',
                        address: '',
                        locality: '',
                        age: '',
                        bloodgroup: '',
                        adhaarNo: '',
                        email: emailController.text,
                        username: usernameController.text,
                        password: passwordController.text,
                        id: '',
                        contact: '',
                        canDonate: false);
                    router.go('/registration-form');
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
                        'Sign Up',
                        style: TextStyle(
                            color: Color.fromRGBO(244, 244, 244, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
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
                      text: 'All ready have an account? ',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(124, 124, 124, 1)),
                      children: [
                        TextSpan(
                          text: 'Log In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/login');
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
