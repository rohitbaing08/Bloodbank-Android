import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/view/components/receiver_card.dart';
import 'package:bloodbank_management/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiversListView extends StatelessWidget {
  const ReceiversListView({super.key});

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
            Expanded(
              child: FutureBuilder(
                future: value.fetchReceivers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                                snapshot.data.length,
                                (index) => Column(
                                      children: [
                                        ReceiverCard(
                                            name: snapshot.data[index].name,
                                            age: snapshot.data[index].age,
                                            location:
                                                snapshot.data[index].locality,
                                            bloodgroup: snapshot
                                                .data[index].bloodgroup),
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
