// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_my_reservation_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_qr_scan_page.dart';
import 'package:new_fit/app/view/scoreboard_page/scoreboard_page.dart';

class MainPage extends BaseView<MainController> {
  @override
  Widget pageScaffold(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: pageBackgroundColor(),
        key: globalKey,
        appBar: appBar(context),
        floatingActionButton: floatingActionButton(),
        body: pageContent(context),
        bottomNavigationBar: bottomNavigationBar(),
        bottomSheet: bottomSheet(),
        drawer: drawer(),
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBar(
      tabController: controller.tabController,
      tabBarController: controller.tabBarController,
    );
  }

  @override
  Widget body(BuildContext context) {
    return TabBarView(
      controller: controller.tabController,
      children: [
        HomePage(scrollController: ScrollController()),
        HomeMyReservationPage(),
        HomeQrScanPage(),
        ScoreboardPage(),
      ],
    );
  }
}
