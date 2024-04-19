import 'package:bloodbank_management/models/user_model.dart';
import 'package:bloodbank_management/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorCard extends StatelessWidget {
  final UserModel donor;

  const DonorCard({
    super.key,
    required this.donor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/Images/profilepic.png'),
          ),
          Text(
            'Name:${donor.name}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            'Age:${donor.age}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            'Location:${donor.locality}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 1),
                border: Border.all(width: 1, color: LightAppColors().seedColor),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              donor.bloodgroup,
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
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: LightAppColors().seedColor),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () async {
                    final Uri url = Uri(scheme: 'tel', path: donor.contact);
                    await launchUrl(url);
                  },
                  icon: Icon(
                    Icons.phone,
                    color: LightAppColors().seedColor,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: LightAppColors().seedColor),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () async {
                    final Uri url = Uri(scheme: 'sms', path: donor.contact);
                    await launchUrl(url);
                  },
                  icon: Icon(
                    Icons.message,
                    color: LightAppColors().seedColor,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: LightAppColors().seedColor),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () async {
                    String message =
                        '''🩸📲 *Hey there! Check out this amazing profile from Hopefully, your go-to blood bank app! 🩸*

👤 *Name:* ${donor.name}
🏠 *Address:* ${donor.address}
🅱️ *Blood Group:* ${donor.bloodgroup}
🎂 *Age:* ${donor.age}
📞 *Contact:* ${donor.contact}
📧 *Email:* ${donor.email}

💉 *Be a lifesaver, join Hopefully today!* 💉
Let's spread the word and make a difference together! 🌟 #DonateBlood #SaveLives 🌟''';
                    await Share.share(message);
                  },
                  icon: Icon(
                    Icons.share,
                    color: LightAppColors().seedColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
