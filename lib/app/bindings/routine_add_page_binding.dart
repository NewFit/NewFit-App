import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_add_page_controller.dart';

class RoutineAddPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoutineAddPageController>(() {
      return RoutineAddPageController();
    });
  }
}
