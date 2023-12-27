import 'package:flutter/widgets.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeQrScanPageController extends BaseController {
  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  bool messageOn = false;
  bool isAvailable = false;

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
