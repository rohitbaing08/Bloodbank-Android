import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:flutter/material.dart';

class BloodbankDetailsView extends StatelessWidget {
  const BloodbankDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            router.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/Images/details.png'),
            ),
            const Text(
              'Blood Bank Name',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Location: Ramavarmupuram, Thrissur',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Tel: +91 487 2323964, 2320999',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Email: admin@bloodbank.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/Images/location.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: LightAppColors().seedColor,
                ),
                height: 60,
                child: const Center(
                  child: Text(
                    'Go for location',
                    style: TextStyle(
                        color: Color.fromRGBO(244, 244, 244, 1),
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
