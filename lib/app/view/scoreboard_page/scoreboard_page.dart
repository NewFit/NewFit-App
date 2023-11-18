// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/score_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_circle_avatar.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';

class ScoreboardPage extends BaseView<ScoreboardPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      scrollController: scrollController,
      widgetList: scoreboardList(20),
    );
  }
}

List<Widget> scoreboardList(int length) {
  return List.generate(length + 1, (index) {
    if (index == 0) {
      return Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Stack(
            children: [
              Positioned(
                top: 80.h,
                width: 320.w,
                child: Row(
                  children: [
                    NewfitCircleAvatar(radius: 40.h),
                    const Spacer(),
                    NewfitCircleAvatar(radius: 40.h),
                  ],
                ),
              ),
              NewfitCircleAvatar(radius: 50.h),
              SizedBox(
                width: 360.w,
                height: 200.h,
              )
            ],
          ),
          SizedBox(height: 20.h),
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: NewfitScoreboardListCell(
        rank: index,
        userNickName: 'userNickName',
        credit: 1000,
        image: Image.asset('images/gorani.png'),
      ),
    );
  });
}
