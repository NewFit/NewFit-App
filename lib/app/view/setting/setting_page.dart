import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/setting_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';

class SettingPage extends BaseView<SettingPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const NewfitAppBarElevated(
      appBarTitleText: '설정',
    );
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(widgetList: []);
  }
}
