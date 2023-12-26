// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:new_fit/app/controller/unregister_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class UnregisterPage extends BaseView<UnregisterPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const NewfitAppBarFlat(
        appBarTitleText: NewfitTextBoldXl(
      text: "회원 탈퇴",
      textColor: AppColors.black,
    ));
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(widgetList: [
      _NewfitFeatureInputTextField(
        hintText: '이메일을 입력하세요.',
        unregisterPageController: controller,
        textEditingController: controller.emailEditingController,
        onChangeFunction: (text) {
          controller.email = text;
          controller.updateCanSubmit();
        },
        textFieldHeight: 60.h,
        minLines: 1,
        validateFunction: (text) {
          if (text == null || text.isEmpty) {
            return '값이 비어있습니다.';
          }
          return null;
        },
      ),
      SizedBox(
        height: 400.h,
      ),
    ]);
  }

  @override
  Widget? bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Obx(
          () => NewfitButton(
            buttonText: '회원 탈퇴',
            buttonColor: controller.canSubmit.value
                ? AppColors.main
                : AppColors.unabledGrey,
            onPressFuntion: () {
              if (controller.canSubmit.value) controller.unregister();
            },
          ),
        ),
      ),
    );
  }
}

class _NewfitFeatureInputTextField extends StatelessWidget {
  _NewfitFeatureInputTextField({
    required this.hintText,
    required this.textEditingController,
    required this.unregisterPageController,
    this.textFieldHeight,
    this.keyboardType,
    this.minLines,
    required this.onChangeFunction,
    required this.validateFunction,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final UnregisterPageController unregisterPageController;
  final double? textFieldHeight;
  final TextInputType? keyboardType;
  final int? minLines;
  final void Function(String) onChangeFunction;
  final String? Function(String?) validateFunction;

  final BorderRadius borderRadius = BorderRadius.circular(7.r);
  final OutlineInputBorder normalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7.r),
    borderSide: BorderSide.none,
  );
  final OutlineInputBorder warningBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7.r),
    borderSide: BorderSide(
      color: AppColors.warning,
      width: 1.w,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      height: textFieldHeight ?? 40.h,
      child: TextFormField(
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h, right: 0),
          focusedBorder: normalBorder,
          enabledBorder: normalBorder,
          errorBorder: warningBorder,
          focusedErrorBorder: warningBorder,
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText,
        ),
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: null,
        autofocus: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateFunction,
        onChanged: onChangeFunction,
      ),
    );
  }
}
