// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/feature_suggest_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class FeatureSuggestPage extends BaseView<FeatureSuggestPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const NewfitAppBarFlat(
        appBarTitleText: NewfitTextBoldXl(
      text: AppString.str_feature_suggest_title,
      textColor: AppColors.black,
    ));
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      widgetList: [],
    );
  }
}
