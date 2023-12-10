// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/view/common/newfit_bottom_nav_bar.dart';
import 'package:new_fit/app/view/common/newfit_text_field.dart';
import 'package:new_fit/app/view/main/home_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_my_reservation_page.dart';
import 'package:new_fit/app/view/scoreboard_page/scoreboard_page.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class MainPage extends BaseView<MainController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
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
        return NewfitIdInputTextField(
            hintText: 'hintText', controller: TextEditingController());
      case MenuCode.RESERVE:
        return HomeMyReservationPage();
      case MenuCode.QR:
        return SvgPicture.asset(
          AppString.newfit,
          height: 100,
          width: 100,
        );
      case MenuCode.SCOREBOARD:
        return ScoreboardPage();

      default:
        return Container();
    }
  }
}
