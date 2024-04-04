import 'package:bloodbank_management/res/colors.dart';
import 'package:flutter/material.dart';

class HelplineView extends StatelessWidget {
  const HelplineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: LightAppColors().seedColor,
            child: const Center(
              child: Text(
                'Helpline',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Always there to help you, no matter the time zone',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '+91 9321279994',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 280,
                  width: 280,
                  child: Image.asset('assets/Images/helpline.png'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
