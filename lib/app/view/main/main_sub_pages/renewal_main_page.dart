// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/controller/newfit_tab_bar_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/data/model/menu/menu_item.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_my_reservation_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_qr_scan_page.dart';
import 'package:new_fit/app/view/scoreboard_page/scoreboard_page.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class RenewalMainPage extends BaseView<MainController> {
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
    return NewfitAppBarElevated(
      tabController: controller.tabController,
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

class NewfitAppBarElevated extends StatelessWidget
    implements PreferredSizeWidget {
  NewfitAppBarElevated({
    super.key,
    required this.tabController,
  });

  final TabController tabController;
  final TabBarController tabBarController = TabBarController();

  @override
  Widget build(BuildContext context) {
    List<TabBarItem> tabItemList = _getTabBarItems();

    return Obx(
      () => Container(
        height: 100.h + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(4.r),
            bottomRight: Radius.circular(4.r),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 10.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                const NewfitTextBold2Xl(text: '뉴핏', textColor: AppColors.black),
                const Spacer(),
                GestureDetector(
                  child: const CircleAvatar(),
                  onTap: () {
                    Get.toNamed(AppPages.MY);
                  },
                ),
                SizedBox(width: 20.w),
              ],
            ),
            const Spacer(),
            TabBar(
              controller: tabController,
              tabs: tabItemList
                  .map(
                    (TabBarItem tabItem) => Tab(
                      child: Text(
                        tabItem.tabBarTitle,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: tabItemList.indexOf(tabItem) ==
                                  tabBarController.selectedIndex
                              ? AppColors.black
                              : AppColors.unabledGrey,
                          fontWeight: tabItemList.indexOf(tabItem) ==
                                  tabBarController.selectedIndex
                              ? AppFontWeights.bold
                              : AppFontWeights.medium,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onTap: (index) {
                tabBarController.updateSelectedIndex(index);
              },
              indicatorColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  List<TabBarItem> _getTabBarItems() {
    return [
      const TabBarItem(
        tabBarTitle: "기구 예약",
        menuCode: MenuCode.HOME,
      ),
      const TabBarItem(
        tabBarTitle: "내 예약",
        menuCode: MenuCode.HOME,
      ),
      const TabBarItem(
        tabBarTitle: "QR/NFC",
        menuCode: MenuCode.HOME,
      ),
      const TabBarItem(
        tabBarTitle: "랭킹",
        menuCode: MenuCode.HOME,
      ),
    ];
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
