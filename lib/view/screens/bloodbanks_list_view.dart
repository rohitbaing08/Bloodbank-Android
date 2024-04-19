import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view/components/bloodbank_card.dart';
import 'package:bloodbank_management/view_model/bloodbank_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class BloodbankListView extends StatelessWidget {
  const BloodbankListView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            router.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Consumer<BloodbankViewModel>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                onChanged: (val) {
                  value.updateList();
                },
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: value.fetchBloodbanks(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: SpinKitSpinningLines(
                              color: LightAppColors().seedColor),
                        );
                      } else {
                        value.data = snapshot.data
                            .where((ele) => ele.name
                                .toString()
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase()))
                            .toList();

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                value.data.length,
                                (index) => BloodbankCard(
                                  bloodbank: value.data[index],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
