import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_routine_card.dart';

class RoutinePage extends BaseView<RoutinePageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarTranparent(
      appBarTitleText: "루틴 페이지",
      scrollController: scrollController,
    );
  }

  RxDouble scrollPosition = 0.0.obs;

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      widgetList: newfitRoutineCardList(),
      scrollController: scrollController,
    );
  }

  List<Widget> newfitRoutineCardList() {
    return List.generate(20, (index) {
      if (index % 2 == 1) {
        return const NewfitRoutineCard();
      } else {
        return SizedBox(height: 15.h);
      }
    });
  }
}
