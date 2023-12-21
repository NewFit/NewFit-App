import 'package:get/get.dart';
import 'package:new_fit/app/controller/feature_suggest_page_controller.dart';

class FeatureSuggestPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeatureSuggestPageController>(() {
      return FeatureSuggestPageController();
    });
  }
}
