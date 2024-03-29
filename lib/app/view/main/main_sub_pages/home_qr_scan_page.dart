// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_qr_scan_page_controller.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeQrScanPage extends BaseView<HomeQrScanPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return BaseBodyWithoutPadding(widgetList: [
      SizedBox(
        height: 400.h,
        child: _buildQrView(context),
      ),
    ]);
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.w
        : 300.w;
    return QRView(
      key: controller.qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController qrViewController) {
    controller.qrViewController = qrViewController;

    controller.qrViewController!.scannedDataStream.listen((scanData) async {
      controller.result = scanData;
      if ((controller.result?.code ?? '') == '1') {
        if (controller.messageOn == false) {
          Get.snackbar(
            '운동 시작',
            '펙덱 플라이 운동 시작!',
            backgroundColor: AppColors.white,
          );
        }
        controller.messageOn = true;
        Get.find<MainController>().onMenuSelected(MenuCode.HOME);
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
