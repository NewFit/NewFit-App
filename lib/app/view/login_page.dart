import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/login_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';

class LoginPage extends BaseView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(widgetList: []);
  }
}
