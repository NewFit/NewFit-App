// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/score_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/loading.dart';
import 'package:new_fit/app/view/common/newfit_circle_avatar.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

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
      widgetList: [
        FutureBuilder(
          future: controller.mainFuture.value,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Loading();
              case ConnectionState.done:
                if (snapshot.hasError) return Container();
                controller.assignFutures((snapshot.data! as List));

                return Column(
                  children: scoreboardList(),
                );
              case ConnectionState.none:
                return const Loading();
            }
          },
        )
      ],
    );
  }

  List<Widget> scoreboardList() {
    return List.generate(
        (controller.scoreBoard.value.rankings?.length ?? 0) + 1, (index) {
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
                      NewfitCircleAvatar(
                        radius: 40.h,
                        nickname:
                            controller.scoreBoard.value.rankings_count! >= 1
                                ? (controller.scoreBoard.value.rankings?[0]
                                        .nickname ??
                                    '')
                                : '',
                      ),
                      const Spacer(),
                      NewfitCircleAvatar(
                        radius: 40.h,
                        nickname:
                            controller.scoreBoard.value.rankings_count! >= 2
                                ? (controller.scoreBoard.value.rankings?[1]
                                        .nickname ??
                                    '')
                                : '',
                      ),
                    ],
                  ),
                ),
                NewfitCircleAvatar(
                  radius: 50.h,
                  nickname: controller.scoreBoard.value.rankings_count! >= 3
                      ? (controller.scoreBoard.value.rankings?[2].nickname ??
                          '')
                      : '',
                ),
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
          rank: controller.scoreBoard.value.rankings?[index].rank ?? 0,
          userNickName:
              controller.scoreBoard.value.rankings?[index].nickname ?? '',
          credit: controller.scoreBoard.value.rankings?[index].amount ?? 0,
          image: Image.asset(AppString.gorani),
        ),
      );
    });
  }
}
