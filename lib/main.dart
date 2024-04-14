import 'package:bloodbank_management/res/routes_constant.dart';
import 'package:bloodbank_management/res/theme/theme_constants.dart';
import 'package:bloodbank_management/view_model/auth_view_model.dart';
import 'package:bloodbank_management/view_model/bloodbank_view_model.dart';
import 'package:bloodbank_management/view_model/camps_view_model.dart';
import 'package:bloodbank_management/view_model/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BloodbankViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CampsViewModel(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
