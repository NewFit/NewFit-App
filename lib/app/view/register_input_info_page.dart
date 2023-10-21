import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_text_field.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class RegisterInputInfoPage extends BaseView<RegisterPageController> {
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
    return BaseBody(
      widgetList: [
        TextField(
          categoryText: '이름',
          hintText: '이름을 입력해주세요.',
          controller: controller.nameEditingController,
        ),
        SizedBox(height: 20.h),
        TextField(
          categoryText: '닉네임',
          hintText: '닉네임을 입력해주세요.',
          controller: controller.nicknameEditingController,
        ),
        SizedBox(height: 20.h),
        TextField(
          categoryText: '전화번호',
          hintText: '전화번호을 입력해주세요.',
          controller: controller.phonenumberEditingController,
        ),
        SizedBox(height: 20.h),
        TextField(
          categoryText: '이메일',
          hintText: '이메일을 입력해주세요.',
          controller: controller.emailEditingController,
        ),
      ],
    );
  }

  Widget TextField(
      {required categoryText, required hintText, required controller}) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: NewfitTextRegularLg(
                text: categoryText, textColor: AppColors.black)),
        SizedBox(
          height: 5.h,
        ),
        NewfitIdInputTextField(
          hintText: hintText,
          controller: controller,
        )
      ],
    );
  }
}
