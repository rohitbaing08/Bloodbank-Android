import 'package:bloodbank_management/view/screens/home_view.dart';
import 'package:bloodbank_management/view/screens/login_view.dart';
import 'package:bloodbank_management/view/screens/register_view.dart';
import 'package:bloodbank_management/view/screens/request_form_screen.dart';
import 'package:bloodbank_management/view/screens/splash_view.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'splash',
    path: '/splash',
    builder: (context, state) => const SplashView(),
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
    name: 'request-form',
    path: '/',
    builder: (context, state) => const RequestForm(),
  )
]);
