import 'package:bloodbank_management/res/colors.dart';
import 'package:flutter/material.dart';

class DonorCard extends StatelessWidget {
  final String name;
  final String age;
  final String location;
  final String imageUrl;
  final String bloodgroup;
  const DonorCard(
      {super.key,
      required this.name,
      required this.age,
      required this.location,
      required this.imageUrl,
      required this.bloodgroup});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imageUrl),
          ),
          Text(
            'Name: $name',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            'Age: $age',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            'Location: $location',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 1),
                border: Border.all(width: 1, color: LightAppColors().seedColor),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              bloodgroup,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    border:
                        Border.all(width: 1, color: LightAppColors().seedColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.phone,
                  color: LightAppColors().seedColor,
                ),
              ),
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    border:
                        Border.all(width: 1, color: LightAppColors().seedColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.message,
                  color: LightAppColors().seedColor,
                ),
              ),
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    border:
                        Border.all(width: 1, color: LightAppColors().seedColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.share,
                  color: LightAppColors().seedColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
