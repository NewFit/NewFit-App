import 'package:get/get.dart';
import 'package:new_fit/app/controller/setting_page_controller.dart';

class SettingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingPageController>(() {
      return SettingPageController();
    });
  }
}
