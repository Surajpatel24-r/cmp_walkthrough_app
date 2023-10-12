import 'dart:async';
import 'package:cmp_walkthrough_app/app/modules/splash/views/splash_second.dart';
import 'package:get/get.dart';
import '../welcome/view.dart';

class SplashController extends GetxController {
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _splashTime();
    _splashTime2();
  }

  void _splashTime() async {
    _timer = Timer(const Duration(seconds: 3), () async {
      Get.to(() => SplashScreen2(),
          transition: Transition.zoom, duration: Duration(milliseconds: 800));
      Get.delete<SplashController>();
    });
  }

  void _splashTime2() async {
    _timer = Timer(const Duration(seconds: 5), () async {
      Get.offAll(() => WelcomeScreen(), transition: Transition.fade);
      Get.delete<SplashController>();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
