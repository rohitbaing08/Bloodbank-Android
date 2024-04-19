import 'package:bloodbank_management/models/bloodbank_model.dart';
import 'package:bloodbank_management/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class BloodbankDetailsView extends StatelessWidget {
  final BloodbankModel bloodbank;
  BloodbankDetailsView({super.key, required this.bloodbank});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Center(
                child: Image.network(
                  bloodbank.image,
                  fit: BoxFit.contain,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text('Image load failed');
                  },
                ),
              ),
            ),
            Text(
              bloodbank.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Location: ${bloodbank.location}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Contact: ${bloodbank.contact}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Email: ${bloodbank.email}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () async {
                await MapsLauncher.launchQuery(bloodbank.address);
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: LightAppColors().seedColor,
                ),
                height: 60,
                child: const Center(
                  child: Text(
                    'Go for location',
                    style: TextStyle(
                        color: Color.fromRGBO(244, 244, 244, 1),
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
