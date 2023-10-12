import 'package:cmp_walkthrough_app/app/modules/authentication/binding.dart';
import 'package:cmp_walkthrough_app/app/modules/authentication/views/login.dart';
import 'package:cmp_walkthrough_app/app/modules/home/binding.dart';
import 'package:cmp_walkthrough_app/app/modules/home/view.dart';
import 'package:cmp_walkthrough_app/app/modules/splash/binding.dart';
import 'package:cmp_walkthrough_app/app/modules/splash/views/splash_first.dart';
import 'package:cmp_walkthrough_app/app/modules/welcome/binding.dart';
import 'package:cmp_walkthrough_app/app/modules/welcome/view.dart';
import 'package:cmp_walkthrough_app/app/routes/routes.dart';
import 'package:get/get.dart';

class GetPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoute.welcome,
      page: () => WelcomeScreen(),
      binding: WelcomeControllerBinding(),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => AuthScreen(),
      binding: AuthScreenControllerBinding(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
