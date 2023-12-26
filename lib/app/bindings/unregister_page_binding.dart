import 'package:get/get.dart';
import 'package:new_fit/app/controller/unregister_page_controller.dart';

class UnregisterPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnregisterPageController>(() {
      return UnregisterPageController();
    });
  }
}
