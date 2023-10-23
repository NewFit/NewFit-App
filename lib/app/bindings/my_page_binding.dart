import 'package:get/get.dart';
import 'package:new_fit/app/controller/my_page_controller.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPageController>(() {
      return MyPageController();
    });
  }
}
