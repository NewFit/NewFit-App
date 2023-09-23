import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

class MainPage extends BaseView<MainController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarWithButton(scrollController: scrollController);
  }

  @override
  Widget body(BuildContext context) {
    return _BasePage(
      scrollController: scrollController,
      widgetList: [
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
        Text("hello"),
      ],
    );
  }
}

class _BasePage extends StatelessWidget {
  final List<Widget> widgetList;
  ScrollController scrollController;
  _BasePage({
    required this.widgetList,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
        width: double.infinity,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}
