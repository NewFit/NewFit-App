import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

//app_theme이외의 텍스트 스타일이 필요할 때 여기 정의해주세요

abstract class AppTextTheme {
  static TextStyle appTitleTextStyle = const TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
