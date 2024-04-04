import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/view/components/bloodbank_card.dart';
import 'package:flutter/material.dart';

class BloodbankListView extends StatelessWidget {
  const BloodbankListView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: LightAppColors().seedColor,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: LightAppColors().seedColor),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BloodbankCard(
                          name: 'Bloodbank 1',
                          website: 'bloodbank1.com',
                          location: 'Thane'),
                      BloodbankCard(
                          name: 'Bloodbank 2',
                          website: 'bloodbank2.com',
                          location: 'Dadar'),
                      BloodbankCard(
                          name: 'Bloodbank 3',
                          website: 'bloodbank3.com',
                          location: 'Belapur'),
                      BloodbankCard(
                          name: 'Bloodbank 4',
                          website: 'bloodbank4.com',
                          location: 'Bhiwandi'),
                      BloodbankCard(
                          name: 'Bloodbank 5',
                          website: 'bloodbank5.com',
                          location: 'Kharghar')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
