import 'package:get/get.dart';
import 'package:new_fit/app/controller/score_page_controller.dart';

class ScoreboardPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoreboardPageController>(() {
      return ScoreboardPageController();
    });
  }
}
