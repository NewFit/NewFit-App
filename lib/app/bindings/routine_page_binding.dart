import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_page_controller.dart';

class RoutinePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoutinePageController>(() {
      return RoutinePageController();
    });
  }
}
