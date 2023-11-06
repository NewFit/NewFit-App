import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_reservation_page_controller.dart';

class HomeReservationPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeReservationPageController>(() {
      return HomeReservationPageController();
    });
  }
}
