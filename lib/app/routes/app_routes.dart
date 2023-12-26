// ignore_for_file: constant_identifier_names

part of './app_pages.dart';

//앱 내 라우트를 정의하는 공간. "/ + 이름"으로 작명해주세요
abstract class Routes {
  Routes._();

  static const TEST_PAGE = _Paths.TEST_PAGE;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const REGISTER_GYM = _Paths.REGISTER_GYM;
  static const MAIN = _Paths.MAIN;
  static const SETTING = _Paths.SETTING;
  static const MY = _Paths.MY;
  static const ROUTINE = _Paths.ROUTINE;
  static const ROUTINE_ADD = _Paths.ROUTINE_ADD;
  static const ROUTINE_MORE_INFO = _Paths.ROUTINE_MORE_INFO;
  static const SCOREBOARD = _Paths.SCOREBOARD;
  static const HOME_RESERVATION = _Paths.HOME_RESERVATION;
  static const FEATURE = _Paths.FEATURE;
  static const HOME_QR_SCAN = _Paths.HOME_QR_SCAN;
}

abstract class _Paths {
  static const TEST_PAGE = '/TEST_PAGE';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const REGISTER_GYM = '/register/gym';
  static const MAIN = '/main';
  static const SETTING = '/setting';
  static const FEATURE = '/feature';
  static const MY = '/my';
  static const ROUTINE = '/routine';
  static const ROUTINE_ADD = '/routine/routine_add';
  static const ROUTINE_MORE_INFO = '/routine_more_info';
  static const SCOREBOARD = '/scoreboard';
  static const HOME_RESERVATION = '/home_reservation';
  static const HOME_QR_SCAN = '/home_qr_scan';
}
