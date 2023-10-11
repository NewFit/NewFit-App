import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class NewfitInfoInputTextField extends StatelessWidget {
  const NewfitInfoInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
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
          hintText: '주소를 입력해주세요.',
        ),
        validator: (value) {
          return _validator(value!);
        },
      ),
    );
  }
}

class NewfitSearchTextField extends StatelessWidget {
  const NewfitSearchTextField({super.key});

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
          error: Text('error'),
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

String? _validator(String pw) {
  if (pw.length > 10) {
    return ('비밀번호를 더 길게 설정해주세요.');
  }

  return null;
}
