import 'package:get/get.dart';
import 'package:new_fit/app/bindings/home_my_reservation_page.dart';
import 'package:new_fit/app/bindings/home_page_binding.dart';
import 'package:new_fit/app/bindings/home_qr_scan_page_binding.dart';
import 'package:new_fit/app/bindings/scoreboard_page_binding.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    });
    ScoreboardPageBinding().dependencies();
    HomePageBinding().dependencies();
    HomeMyReservationPageBinding().dependencies();
    HomeQrScanPageBinding().dependencies();
  }
}
