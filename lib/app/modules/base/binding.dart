import 'package:cmp_walkthrough_app/app/modules/base/controller.dart';
import 'package:get/get.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BaseController());
  }
}
