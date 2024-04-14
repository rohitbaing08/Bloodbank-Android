import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/view/components/camp_card.dart';
import 'package:bloodbank_management/view_model/camps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Consumer<CampsViewModel>(
            builder: (context, value, child) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: value.fetchCamps(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      var data = snapshot.data;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                                data.length,
                                (index) => CampCard(
                                    name: data[index].name,
                                    url: '',
                                    date: data[index].date,
                                    location: data[index].location))
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
