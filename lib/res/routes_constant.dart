import 'package:bloodbank_management/view/screens/bloodbanks_list_view.dart';
import 'package:bloodbank_management/view/screens/bottom_navbar.dart';
import 'package:bloodbank_management/view/screens/camps_list_view.dart';
import 'package:bloodbank_management/view/screens/donors_list_view.dart';
import 'package:bloodbank_management/view/screens/helpline_view.dart';
import 'package:bloodbank_management/view/screens/home_view.dart';
import 'package:bloodbank_management/view/screens/login_view.dart';
import 'package:bloodbank_management/view/screens/otp_verification.dart';
import 'package:bloodbank_management/view/screens/receivers_list_view.dart';
import 'package:bloodbank_management/view/screens/register_view.dart';
import 'package:bloodbank_management/view/screens/registration_form_screen.dart';
import 'package:bloodbank_management/view/screens/splash_view.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'splash',
    path: '/',
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    name: 'bottom-navbar',
    path: '/bottom-nav',
    builder: (context, state) => const BottomNavBar(),
  ),
  GoRoute(
    name: 'home',
    path: '/home',
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    name: 'register',
    path: '/register',
    builder: (context, state) => const RegisterView(),
  ),
  GoRoute(
    name: 'login',
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    name: 'registration-form',
    path: '/registration-form',
    builder: (context, state) => const RegistrationForm(),
  ),
  GoRoute(
    name: 'otp-verification',
    path: '/otp-verification',
    builder: (context, state) => const OTPVerificationView(),
  ),
  GoRoute(
    name: 'helpline',
    path: '/helpline',
    builder: (context, state) => const HelplineView(),
  ),
  GoRoute(
    name: 'camps-list',
    path: '/camps-list',
    builder: (context, state) => const CampsListView(),
  ),
  GoRoute(
    name: 'bloodbanks-list',
    path: '/bloodbanks-list',
    builder: (context, state) => const BloodbankListView(),
  ),
  GoRoute(
    name: 'receivers-list',
    path: '/receivers-list',
    builder: (context, state) => const ReceiversListView(),
  ),
  GoRoute(
    name: 'donors-list',
    path: '/donors-list',
    builder: (context, state) => const DonorsListView(),
  ),
]);
