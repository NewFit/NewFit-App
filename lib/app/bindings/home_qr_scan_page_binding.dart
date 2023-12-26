import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_qr_scan_page_controller.dart';

class HomeQrScanPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeQrScanPageController>(() {
      return HomeQrScanPageController();
    });
  }
}
