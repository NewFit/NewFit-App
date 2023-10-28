import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_textfield_with_category.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class RegisterPhonenumberInputPage extends BaseView<RegisterPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return Color(0xFFF2F4F6);
  }

  @override
  Widget body(BuildContext context) {
    return BaseBodyWithNoScroll(
      widgetList: [
        SizedBox(
          height: 50.h,
        ),
        NewfitTextfieldWithTitle(
          titleText: '전화번호를 입력해주세요.',
          hintText: '01012340000',
          controller: controller.nameEditingController,
        ),
        Spacer(),
        NewfitButton(
          buttonText: '다음',
          buttonColor: AppColors.main,
          onPressFuntion: () {
            controller.tabController
                .animateTo((controller.tabController.index + 1) % 6);
            controller.currentTabIndex.value = 5;
          },
        ),
      ],
    );
  }
}
