import 'package:bloodbank_management/models/user_model.dart';
import 'package:bloodbank_management/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ReceiverCard extends StatelessWidget {
  final UserModel receiver;

  const ReceiverCard({
    super.key,
    required this.receiver,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: Image.asset('assets/Images/profilepic.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name:${receiver.name}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Age:${receiver.age}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Location:${receiver.locality}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    border:
                        Border.all(width: 1, color: LightAppColors().seedColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  receiver.bloodgroup,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ],
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
                    final Uri url = Uri(scheme: 'tel', path: receiver.contact);
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
                    final Uri url = Uri(scheme: 'sms', path: receiver.contact);
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

👤 *Name:* ${receiver.name}
🏠 *Address:* ${receiver.address}
🅱️ *Blood Group:* ${receiver.bloodgroup}
🎂 *Age:* ${receiver.age}
📞 *Contact:* ${receiver.contact}
📧 *Email:* ${receiver.email}

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
