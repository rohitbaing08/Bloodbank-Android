import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view/components/bloodbank_card.dart';
import 'package:bloodbank_management/view_model/bloodbank_view_model.dart';
import 'package:flutter/material.dart';
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
                onChanged: (value) {},
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
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        var data = snapshot.data;
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                data.length,
                                (index) => BloodbankCard(
                                    name: data[index].name,
                                    website: data[index].email,
                                    location: data[index].location),
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
