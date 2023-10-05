import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_bottom_nav_bar.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

import 'package:new_fit/app/view/theme/app_values.dart';

class MainPage extends BaseView<MainController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarWithButton(scrollController: scrollController);
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(() => getPageOnSelectedMenu(controller.selectedMenuCode)),
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
        // return homeView;
        return Container();
      case MenuCode.RESERVE:
        // return goalView;
        return Container();
      case MenuCode.QR:
        return Container();
      case MenuCode.MYPAGE:
        // return goalView;
        return Container();
      default:
        // return LoginPage();
        return Container();
    }
  }
}

class _BasePage extends StatelessWidget {
  final List<Widget> widgetList;
  ScrollController scrollController;
  _BasePage({
    required this.widgetList,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
        width: double.infinity,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}
