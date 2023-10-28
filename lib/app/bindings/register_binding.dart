import 'package:get/get.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPageController>(() {
      return RegisterPageController();
    });
  }
}
