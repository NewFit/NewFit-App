import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_my_reservation_page_controller.dart';

class HomeMyReservationPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMyReservationPageController>(() {
      return HomeMyReservationPageController();
    });
  }
}
