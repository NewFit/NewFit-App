// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:new_fit/app/bindings/home_reservation_page_binding.dart';
import 'package:new_fit/app/bindings/my_page_binding.dart';
import 'package:new_fit/app/bindings/register_binding.dart';
import 'package:new_fit/app/bindings/login_binding.dart';
import 'package:new_fit/app/bindings/routine_page_binding.dart';
import 'package:new_fit/app/bindings/scoreboard_page_binding.dart';
import 'package:new_fit/app/view/login_page/login_page.dart';
import 'package:new_fit/app/view/main/main_sub_pages/home_reservation_page.dart';
import 'package:new_fit/app/view/main_page.dart';
import 'package:new_fit/app/view/my_page/my_page.dart';
import 'package:new_fit/app/view/register_page/register_page.dart';
import 'package:new_fit/app/view/routine_page/routine_page.dart';
import 'package:new_fit/app/view/scoreboard_page/scoreboard_page.dart';


import '../bindings/main_binding.dart';

part './app_routes.dart';

// 앱 내 페이지를 정의하는 공간, 페이지 만든 후 여기에 정의해주세요
class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;
  static const REGISTER = Routes.REGISTER;
  static const LOGIN = Routes.LOGIN;
  static const MY = Routes.MY;
  static const ROUTINE = Routes.ROUTINE;
  static const SCOREBOARD = Routes.SCOREBOARD;
  static const TEST_PAGE = Routes.TEST_PAGE;

  static final pages = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.MY,
      page: () => MyPage(),
      binding: MyPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ROUTINE,
      page: () => RoutinePage(),
      binding: RoutinePageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SCOREBOARD,
      page: () => ScoreboardPage(),
      binding: ScoreboardPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.HOME_RESERVATION,
      page: () => HomeReservationPage(),
      binding: HomeReservationPageBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
