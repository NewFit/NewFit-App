// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

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
        /*
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return _validator(value!);
        },
        */
      ),
    );
  }

  String? _validator(String value) {
    return null;
  }
}

class NewfitIdInputTextField extends NewfitInfoInputTextField {
  const NewfitIdInputTextField({
    required super.hintText,
    required super.controller,
  });

  @override
  String? _validator(String value) {
    if (value.length < 10) {
      return ('아이디에는 특수기호를 사용할 수 없습니다.');
    }
    return null;
  }
}

class NewfitPasswordInputTextField extends NewfitInfoInputTextField {
  const NewfitPasswordInputTextField({
    required super.hintText,
    required super.controller,
  });

  @override
  String? _validator(String value) {
    if (value.length <= 7) {
      return ('비밀번호를 더 길게 설정해주세요.');
    }
    return null;
  }
}

class NewfitSearchTextField extends StatelessWidget {
  const NewfitSearchTextField({
    required this.hintText,
    super.key,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: TextField(
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
      ),
    );
  }
}
