// ignore_for_file: must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/newfit_tab_bar_controller.dart';
import 'package:new_fit/app/controller/routine_add_page_controller.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/data/model/menu/menu_item.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/newfit_text_field.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

class NewfitAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewfitAppBar({
    super.key,
    required this.tabController,
    required this.tabBarController,
  });

  final TabController tabController;
  final TabBarController tabBarController;

  @override
  Widget build(BuildContext context) {
    List<TabBarItem> tabItemList = _getTabBarItems();

    return Obx(
      () => Container(
        height: 90.h + MediaQuery.of(context).padding.top,
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
                const NewfitTextBold2Xl(
                    text: AppString.str_app_title_kor,
                    textColor: AppColors.black),
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
                              : AppColors.textUnabled,
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
        tabBarTitle: AppString.tabbar_home,
        menuCode: MenuCode.HOME,
      ),
      const TabBarItem(
        tabBarTitle: AppString.tabbar_reserve,
        menuCode: MenuCode.RESERVE,
      ),
      const TabBarItem(
        tabBarTitle: AppString.tabbar_qr,
        menuCode: MenuCode.QR,
      ),
      const TabBarItem(
        tabBarTitle: AppString.tabbar_scoreboard,
        menuCode: MenuCode.SCOREBOARD,
      ),
    ];
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}

class NewfitAppBarElevated extends StatelessWidget
    implements PreferredSizeWidget {
  const NewfitAppBarElevated({
    super.key,
    required this.appBarTitleText,
  });

  final String appBarTitleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 25.r,
            offset: const Offset(0, 0),
          ),
        ],
        color: Colors.white,
      ),
      child: SafeArea(
        child: Center(
          child: NewfitTextBoldXl(
            text: appBarTitleText,
            textColor: AppColors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class NewfitAppBarFlat extends StatelessWidget implements PreferredSizeWidget {
  const NewfitAppBarFlat({
    super.key,
    required this.appBarTitleText,
  });

  final Widget appBarTitleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
        color: Colors.transparent,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: AppValues.margin),
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                )),
            Center(
              child: appBarTitleText,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class NewfitAppBarTranparent extends StatelessWidget
    implements PreferredSizeWidget {
  NewfitAppBarTranparent({
    super.key,
    required this.scrollController,
    required this.appBarTitleText,
  });

  final String appBarTitleText;
  ScrollController scrollController;
  Rx<double> scrollPosition = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(_scrollListener);
    int transparency = 0;
    double blurRadius = 0.0;
    double opacity = 0;

    return Obx(() {
      transparency = (scrollPosition.value).round() * 2;
      blurRadius = scrollPosition.value * 40 / 255;
      opacity = scrollPosition.value * 0.2 / 255;

      if (transparency >= 255) {
        transparency = 255;
      } else if (transparency < 0) {
        transparency = 0;
      }

      if (blurRadius >= 20) {
        blurRadius = 20;
      } else if (blurRadius < 0) {
        blurRadius = 0;
      }

      if (opacity >= 0.1) {
        opacity = 0.1;
      } else if (opacity < 0) {
        opacity = 0;
      }
      Color appBarColor = Color.fromARGB(transparency, 255, 255, 255);

      return Container(
        height: 50.h + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(opacity),
              offset: const Offset(0, 0),
              spreadRadius: 0.1,
              blurRadius: blurRadius,
            ),
          ],
          color: appBarColor,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: NewfitTextBoldXl(
                  text: appBarTitleText,
                  textColor: AppColors.black,
                ),
              ),
              Positioned(
                left: 15.w,
                child: SizedBox(
                  height: 50.h,
                  child: Column(
                    children: [
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  _scrollListener() {
    scrollPosition.value = scrollController.offset;
  }
}

class NewfitRoutineAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  NewfitRoutineAppBar(
      {super.key,
      required this.controller,
      required this.goBackFunction,
      required this.hintText});

  RoutineAddPageController controller;
  final void Function() goBackFunction;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
        color: Colors.transparent,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Center(
                child: SizedBox(
              width: 200.w,
              child: NewfitRoutineAppbarTextField(
                controller: controller.routineNameEditingController,
                hintText: hintText,
              ),
            )),
            Positioned(
              left: 15.w,
              child: SizedBox(
                height: 50.h,
                child: Column(
                  children: [
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: goBackFunction,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
