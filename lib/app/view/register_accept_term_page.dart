import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class RegisterAcceptTermPage extends BaseView<RegisterPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  @override
  Widget body(BuildContext context) {
    return BaseBodyWithNoScroll(
      widgetList: [
        SizedBox(
          height: 20.h,
        ),
        Row(children: [
          SvgPicture.asset(
            AppString.newfit,
            width: 100.w,
          ),
          SizedBox(width: 13.w),
          const NewfitTextBold2Xl(text: "이용약관", textColor: AppColors.black),
        ]),
        SizedBox(height: 30.h),
        NewfitToggleList(toggleText: "약관 1", checked: true),
        SizedBox(height: 15.h),
        NewfitToggleList(toggleText: "약관 2", checked: true),
        SizedBox(height: 15.h),
        NewfitToggleList(toggleText: "약관 3", checked: true),
        SizedBox(height: 15.h),
        NewfitToggleList(toggleText: "약관 4", checked: true),
        SizedBox(height: 15.h),
        Divider(
          color: AppColors.accent,
          thickness: 1.h,
        ),
        SizedBox(height: 20.h),
        NewfitToggleList(toggleText: "약관 전체 동의하기", checked: true),
        Spacer(),
        NewfitButton(
          buttonText: "다음",
          buttonColor: AppColors.main,
          onPressFuntion: () {
            controller.tabController
                .animateTo((controller.tabController.index + 1) % 3);
            controller.currentTabIndex.value = 1;
          },
        )
      ],
    );
  }
}
