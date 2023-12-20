// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:new_fit/app/bindings/feature_suggest_page_binding.dart';
import 'package:new_fit/app/bindings/my_page_binding.dart';
import 'package:new_fit/app/bindings/register_binding.dart';
import 'package:new_fit/app/bindings/login_binding.dart';
import 'package:new_fit/app/bindings/register_gym_page_binding.dart';
import 'package:new_fit/app/bindings/routine_add_page_binding.dart';
import 'package:new_fit/app/bindings/routine_more_info_page_binding.dart';
import 'package:new_fit/app/bindings/routine_page_binding.dart';
import 'package:new_fit/app/bindings/scoreboard_page_binding.dart';
import 'package:new_fit/app/bindings/setting_page_binding.dart';
import 'package:new_fit/app/view/login_page/login_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_reservation_page.dart';
import 'package:new_fit/app/view/main_page.dart';
import 'package:new_fit/app/view/my_page/my_page.dart';
import 'package:new_fit/app/view/register_page/register_gym_page.dart';
import 'package:new_fit/app/view/register_page/register_page.dart';
import 'package:new_fit/app/view/routine_page/routine_add_page.dart';
import 'package:new_fit/app/view/routine_page/routine_more_info_page.dart';
import 'package:new_fit/app/view/routine_page/routine_page.dart';
import 'package:new_fit/app/view/scoreboard_page/scoreboard_page.dart';
import 'package:new_fit/app/view/setting/setting_page.dart';
import 'package:new_fit/app/view/setting/setting_sub_pages.dart/feature_sueggest_page.dart';

import '../bindings/main_binding.dart';

part './app_routes.dart';

// 앱 내 페이지를 정의하는 공간, 페이지 만든 후 여기에 정의해주세요
class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;
  static const REGISTER = Routes.REGISTER;
  static const REGISTER_GYM = Routes.REGISTER_GYM;
  static const LOGIN = Routes.LOGIN;
  static const MY = Routes.MY;
  static const ROUTINE = Routes.ROUTINE;
  static const ROUTINE_ADD = Routes.ROUTINE_ADD;
  static const ROUTINE_MORE_INFO = Routes.ROUTINE_MORE_INFO;
  static const SCOREBOARD = Routes.SCOREBOARD;
  static const TEST_PAGE = Routes.TEST_PAGE;
  static const SETTING = Routes.SETTING;
  static const FEATURE = Routes.FEATURE;

  static final pages = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.REGISTER_GYM,
      page: () => RegisterGymPage(),
      binding: RegisterGymPageBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.MY,
      page: () => MyPage(),
      binding: MyPageBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.ROUTINE,
      page: () => RoutinePage(),
      binding: RoutinePageBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.ROUTINE_ADD,
      page: () => RoutineAddPage(),
      binding: RoutineAddPageBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.ROUTINE_MORE_INFO,
      page: () => RoutineMoreInfoPage(),
      binding: RoutineMoreInfoPageBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.SCOREBOARD,
      page: () => ScoreboardPage(),
      binding: ScoreboardPageBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.HOME_RESERVATION,
      page: () => HomeReservationPage(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingPage(),
      binding: SettingPageBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: _Paths.FEATURE,
      page: () => FeatureSuggestPage(),
      binding: FeatureSuggestPageBinding(),
      transition: Transition.native,
    ),
  ];
}
