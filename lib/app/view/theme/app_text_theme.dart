// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';
import 'app_colors.dart';

//app_theme이외의 텍스트 스타일이 필요할 때 여기 정의해주세요

abstract class AppTextTheme {
  static TextStyle bold_md = const TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold_lg = const TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: AppFontWeights.bold,
  );

  static TextStyle bold_xl = const TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: AppFontWeights.bold,
  );

  static TextStyle bold_2xl = const TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: AppFontWeights.bold,
  );

  static TextStyle medium_md = const TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: AppFontWeights.medium,
  );

  static TextStyle regular_xs = const TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontWeight: AppFontWeights.regular,
  );

  static TextStyle regular_md = const TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: AppFontWeights.regular,
  );

  static TextStyle regular_lg = const TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: AppFontWeights.regular,
  );

  static TextStyle regular_xl = const TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: AppFontWeights.regular,
  );
}
