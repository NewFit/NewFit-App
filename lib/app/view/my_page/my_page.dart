import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:new_fit/app/controller/my_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class MyPage extends BaseView<MyPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  RxDouble scrollPosition = 0.0.obs;
  // @override
  // Color pageBackgroundColor() {
  //   return AppColors.pageBackground;
  // }

  _scrollListener() {
    scrollPosition.value = scrollController.offset;
  }

  @override
  Widget body(BuildContext context) {
    return test();
  }

  Widget test() {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              UserInfoTab(),
              SizedBox(
                height: 3000,
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Align(
            alignment: Alignment.center,
            child: SafeArea(
              child: Container(
                width: 360.w,
                child: NewfitAppBarTranparent(
                  scrollController: scrollController,
                  appBarTitleText: '마이 페이지',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget UserInfoTab() {
    return Stack(
      children: [
        SizedBox(
          height: 250.h,
          width: double.infinity,
        ),
        Positioned(
          top: 75.h,
          child: Container(
            height: 175.h,
            width: 360.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              color: AppColors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 75.w,
          ),
        ),
      ],
    );
  }
}
