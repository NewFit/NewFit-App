import 'package:get/get.dart';
import 'package:new_fit/app/controller/reigster_gym_page_controller.dart';

class RegisterGymPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterGymPageController>(() {
      return RegisterGymPageController();
    });
  }
}
