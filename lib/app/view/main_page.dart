import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/view/common/newfit_bottom_nav_bar.dart';
import 'package:new_fit/app/view/main/home_page.dart';
import 'package:new_fit/app/view/scoreboard_page/scoreboard_page.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

import 'package:new_fit/app/view/theme/app_values.dart';

class MainPage extends BaseView<MainController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarWithButton(
      scrollController: scrollController,
      totalCredit: 10000,
      todayCredit: 100,
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
        return HomePage(
          scrollController: scrollController,
        );
      case MenuCode.RESERVE:
        return Container();
      case MenuCode.QR:
        return SvgPicture.asset(
          'images/newfit_logo.svg',
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
