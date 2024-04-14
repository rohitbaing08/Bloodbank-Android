import 'package:bloodbank_management/res/colors.dart';
import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:flutter/material.dart';

class BloodbankCard extends StatelessWidget {
  final String name;
  final String website;
  final String location;
  const BloodbankCard(
      {super.key,
      required this.name,
      required this.website,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 110,
        width: double.infinity,
        child: Card(
          color: LightAppColors().cardBackgroundColor,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email: $website',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Location: $location',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        router.push('/bloodbanks-details');
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: LightAppColors().seedColor,
                        ),
                        height: 30,
                        width: 100,
                        child: const Center(
                          child: Text(
                            'View more',
                            style: TextStyle(
                                color: Color.fromRGBO(244, 244, 244, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
