import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view/components/donor_card.dart';
import 'package:flutter/material.dart';

class DonorsListView extends StatelessWidget {
  const DonorsListView({super.key});

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
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: LightAppColors().seedColor,
            child: const Center(
              child: Text(
                'Receive Blood',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DonorCard(
                        name: 'Jay',
                        age: '20',
                        location: 'Bhiwandi',
                        imageUrl: 'assets/Images/person2.png',
                        bloodgroup: 'A+'),
                    Divider(
                      height: 10,
                      indent: 40,
                      endIndent: 40,
                    ),
                    DonorCard(
                        name: 'Mansi',
                        age: '21',
                        location: 'Kharghar',
                        imageUrl: 'assets/Images/person3.png',
                        bloodgroup: 'B-'),
                    DonorCard(
                        name: 'Sanjay',
                        age: '35',
                        location: 'Bhiwandi',
                        imageUrl: 'assets/Images/person1.png',
                        bloodgroup: 'B+'),
                    Divider(
                      height: 10,
                      indent: 40,
                      endIndent: 40,
                    ),
                    DonorCard(
                        name: 'Suman',
                        age: '40',
                        location: 'Govandi',
                        imageUrl: 'assets/Images/person3.png',
                        bloodgroup: 'O+'),
                    Divider(
                      height: 10,
                      indent: 40,
                      endIndent: 40,
                    ),
                    DonorCard(
                        name: 'Prasad',
                        age: '29',
                        location: 'Belapur',
                        imageUrl: 'assets/Images/person1.png',
                        bloodgroup: 'AB+'),
                    Divider(
                      height: 10,
                      indent: 40,
                      endIndent: 40,
                    ),
                    DonorCard(
                        name: 'Abhay',
                        age: '23',
                        location: 'Kurla',
                        imageUrl: 'assets/Images/person2.png',
                        bloodgroup: 'A-'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
