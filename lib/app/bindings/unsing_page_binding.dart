import 'package:get/get.dart';
import 'package:new_fit/app/controller/unsign_page_controller.dart';

class UnsignPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnsignPageController>(() {
      return UnsignPageController();
    });
  }
}
