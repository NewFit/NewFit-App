// ignore_for_file: constant_identifier_names

abstract class AppString {
  static const str_app_title_eng = "NewFit";
  static const str_app_title_kor = "뉴핏";
  static const str_mypage_title = "마이 페이지";
  static const str_register_title = "회원가입";
  static const str_routine_spec_title = "루틴 상세 정보";
  static const str_routine_title = "루틴";
  static const str_settting_title = "설정";
  static const str_scoreboard_title = "스코어보드";
  static const str_new_routine_title = "새로운 루틴";
  static const str_feature_suggest_title = "기능 제안";
  static const str_total_credit = "전체 크레딧";
  static const str_today_credit = "일일 크레딧";

  static const str_error_id_cannot_use_special_character =
      "아이디에는 특수기호를 사용할 수 없습니다.";
  static const str_error_need_long_password = "비밀번호를 더 길게 설정해주세요.";
  static const str_error_cannot_use_email = "사용할 수 없는 이메일입니다.";
  static const str_tmp_equipment_name = "천국의 계단1";
  static const str_no_data = "정보가 없습니다.";
  static const str_reservation_available = "예약 가능";
  static const str_reservation_unavailable = "예약 불가";

  static const textfield_email = "이메일을 입력해주세요.";
  static const textfield_email_hint = "newfit@newfit.com";
  static const textfield_name = "이름을 입력해주세요.";
  static const textfield_name_hint = "홍길동";
  static const textfield_nickname = "닉네임을 입력해주세요.";
  static const textfield_nickname_hint = "김뉴핏";
  static const textfield_tel = "전화번호를 입력해주세요.";
  static const textfield_tel_hint = "010-0000-0000";

  // Button Text
  static const button_google_login = "구글 로그인";
  static const button_kakao_login = "카카오 로그인";
  static const button_reservation = "예약";
  static const button_my_routine = "나의 루틴";
  static const button_reservation_with_routine = "루틴으로 예약하기";
  static const button_aceept_all_terms = "약관 전체 동의하기";
  static const button_next = "다음";
  static const button_welcome = "환영합니다!";
  static const button_request_register = "등록 요청하기";
  static const button_do_later = "다음에 할게요.";
  static const button_edit_routine = "루틴 수정하기";
  static const button_add_routine = "루틴 추가";
  static const button_add_equipment = "기구 추가";

  // TabBar Text
  static const tabbar_home = "기구 예약";
  static const tabbar_reserve = "내 예약";
  static const tabbar_qr = "QR/NFC";
  static const tabbar_scoreboard = "랭킹";

  // SnackBar Text
  static const snackbar_check_reservation = "예약 확인";

  /*System Texts*/
  static const key_oauth_history_id = 'oauth-history-id';
  static const key_user_id = 'user-id';
  static const key_authority_id = 'authority-id';
  static const key_access_token = 'access-token';
  static const key_refresh_token = 'refresh-token';
  static const key_email = 'user-email';
  static const key_name = 'user-name';
  static const key_nickname = 'user-nickname';
  static const key_tel = 'user-tel';
  static const key_profile_file_path = 'user-profile-file-path';
  static const key_total_credit = 'total-credit';
  static const key_this_month_credit = 'this-month-credit';
  static const key_gym_id = 'gym_id';

  static const provier_type_google = 'GOOGLE';
  static const provier_type_kakao = 'KAKAO';
  static const provier_type_apple = 'APPLE';
  static const date_format_hh_mm = 'yyyy-mm-dd HH:mm';
  static const equipment_condition_available = 'AVAILABLE';

  static const debug_kakao_login_success = '카카오계정으로 로그인 성공';
  static const debug_kakao_login_fail = '카카오계정으로 로그인 실패';
  static const debug_not_registered = 'not registered user';
  static const debug_registered = 'registered user';
  static const debug_gym_not_registered = 'registered but gym not registered';

  static const platform_error_code = 'CANCELED';

  static const jwt_prefix = 'Bearer';

  // Local 이미지 소스
  static const home = 'images/icon_home.svg';
  static const reserve = 'images/icon_reserve.svg';
  static const qr = 'images/icon_qr.svg';
  static const mypage = 'images/icon_mypage.svg';
  static const newfit = 'images/newfit_logo.svg';
  static const google = 'images/icon_google.png';
  static const kakao = 'images/icon_kakao.png';
  static const gorani = 'images/gorani.png';
  static const defaultEquipment = 'images/test.png';
}
