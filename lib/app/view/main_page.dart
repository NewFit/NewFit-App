import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';

class MainPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBar();
  }

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
