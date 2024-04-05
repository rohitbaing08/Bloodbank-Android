import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/view/components/camp_card.dart';
import 'package:flutter/material.dart';

class CampsListView extends StatelessWidget {
  const CampsListView({super.key});

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
                'Blood Donation Camps',
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
                    CampCard(
                        name: 'Campaign 1',
                        url: '',
                        date: '24/04/2024',
                        location: 'Thane'),
                    CampCard(
                        name: 'Campaign 2',
                        url: '',
                        date: '15/04/2024',
                        location: 'Dadar'),
                    CampCard(
                        name: 'Campaign 3',
                        url: '',
                        date: '24/03/2024',
                        location: 'Belapur'),
                    CampCard(
                        name: 'Campaign 4',
                        url: '',
                        date: '04/04/2024',
                        location: 'Bhiwandi'),
                    CampCard(
                        name: 'Campaign 5',
                        url: '',
                        date: '20/04/2024',
                        location: 'Kharghar')
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
