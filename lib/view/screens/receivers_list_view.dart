import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view/components/receiver_card.dart';
import 'package:bloodbank_management/view/components/search_filters.dart';
import 'package:bloodbank_management/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiversListView extends StatelessWidget {
  const ReceiversListView({super.key});

  @override
  Widget build(BuildContext context) {
    String? bloodgroup;
    String? location;
    String selectedBloodgroup = '';
    String selectedLocation = '';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            router.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, value, child) => Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: LightAppColors().seedColor,
              child: const Center(
                child: Text(
                  'Donate Blood',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SearchFilter(
                  title: 'Location',
                  selected: location,
                  ontap: (val) {
                    print(val);
                    selectedLocation = val;
                    value.updateList();
                  },
                  items: value.locationList1,
                ),
                SearchFilter(
                  title: 'Type',
                  selected: bloodgroup,
                  ontap: (val) {
                    print(val);
                    selectedBloodgroup = val;
                    value.updateList();
                  },
                  items: value.bloodgroupsList1,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: value.fetchReceivers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    var data = snapshot.data
                        .where((element) =>
                            element.bloodgroup
                                .toString()
                                .toLowerCase()
                                .contains(selectedBloodgroup.toLowerCase()) &&
                            element.locality
                                .toString()
                                .toLowerCase()
                                .contains(selectedLocation.toLowerCase()))
                        .toList();
                    print(data);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                                data.length,
                                (index) => Column(
                                      children: [
                                        ReceiverCard(
                                            name: data[index].name,
                                            age: data[index].age,
                                            location: data[index].locality,
                                            bloodgroup: data[index].bloodgroup),
                                        const Divider(
                                          height: 10,
                                          indent: 40,
                                          endIndent: 40,
                                        )
                                      ],
                                    ))
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
