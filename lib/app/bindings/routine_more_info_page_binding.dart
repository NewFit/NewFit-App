import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_more_info_page_controller.dart';

class RoutineMoreInfoPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoutineMoreInfoPageController>(() {
      return RoutineMoreInfoPageController();
    });
  }
}
