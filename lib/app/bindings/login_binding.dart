import 'package:get/get.dart';
import 'package:new_fit/app/controller/login_page_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() {
      return LoginPageController();
    });
  }
}
