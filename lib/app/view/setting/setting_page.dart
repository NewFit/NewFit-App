// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/setting_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class SettingPage extends BaseView<SettingPageController> with StorageUtil {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const NewfitAppBarFlat(
      appBarTitleText: NewfitTextBoldXl(
        text: AppString.str_settting_title,
        textColor: AppColors.black,
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(widgetList: [
      SizedBox(
        height: 10.h,
      ),
      NewfitSettingList(
        categoryText: '기타',
        children: [
          NewfitSettingListCell(
            settingTitle: '✍️ 기능 제안',
            textColor: AppColors.black,
            onPressedFunction: () {
              Get.toNamed(AppPages.FEATURE);
            },
          )
        ],
      ),
      SizedBox(
        height: 10.h,
      ),
      NewfitSettingList(
        categoryText: '계정 관리',
        children: [
          NewfitSettingListCell(
            settingTitle: '🚪 회원탈퇴',
            textColor: AppColors.warning,
            onPressedFunction: () {
              Get.toNamed(AppPages.UNREGISTER);
            },
          ),
        ],
      ),
    ]);
  }
}
