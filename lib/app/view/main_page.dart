// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_my_reservation_page_controller.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/view/common/newfit_bottom_nav_bar.dart';
import 'package:new_fit/app/view/main/home_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_my_reservation_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_qr_scan_page.dart';
import 'package:new_fit/app/view/scoreboard_page/scoreboard_page.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class MainPage extends BaseView<MainController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  final HomeMyReservationPageController homeMyReservationPageController =
      Get.find();
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBar(
      mainController: controller,
      scrollController: scrollController,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(() {
        return getPageOnSelectedMenu(controller.selectedMenuCode);
      }),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return NewfitBottomNavigationBar(
      onNewMenuSelected: controller.onMenuSelected,
    );
  }

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return HomePage(scrollController: scrollController);
      case MenuCode.RESERVE:
        return HomeMyReservationPage(scrollController: scrollController);
      case MenuCode.QR:
        return QRViewExample();
      case MenuCode.SCOREBOARD:
        return ScoreboardPage();

      default:
        return Container();
    }
  }
}
