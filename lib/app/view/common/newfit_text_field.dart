// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

class NewfitInfoInputTextField extends StatelessWidget {
  const NewfitInfoInputTextField({
    required this.hintText,
    required this.controller,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h, right: 0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: AppColors.warning,
              width: 1.w,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: AppColors.warning,
              width: 1.w,
            ),
          ),
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText,
        ),
        autofocus: false,
      ),
    );
  }
}

class NewfitIdInputTextField extends NewfitInfoInputTextField {
  const NewfitIdInputTextField({
    required super.hintText,
    required super.controller,
  });
}

class NewfitPasswordInputTextField extends NewfitInfoInputTextField {
  const NewfitPasswordInputTextField({
    required super.hintText,
    required super.controller,
  });
}

class NewfitRoutineAppbarTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const NewfitRoutineAppbarTextField({
    required this.controller,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 2,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black,
            width: 4,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: AppFontWeights.bold,
          color: Colors.grey,
        ),
      ),
      style: TextStyle(fontSize: 18.sp, fontWeight: AppFontWeights.bold),
    );
  }
}

class NewfitSearchTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onSubmittedFunction;

  const NewfitSearchTextField({
    required this.textEditingController,
    required this.onSubmittedFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: TextField(
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: AppColors.blue500,
              width: 2.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: AppColors.blue500,
              width: 2.w,
            ),
          ),
          hintText: '주소를 입력해주세요.',
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
          suffixIcon: const Icon(
            Icons.close,
            color: AppColors.black,
          ),
        ),
        onSubmitted: (value) {
          onSubmittedFunction(value);
        },
      ),
    );
  }
}
