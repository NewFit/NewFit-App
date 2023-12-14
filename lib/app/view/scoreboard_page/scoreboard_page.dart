// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/score_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/json_models/credit/credit_model.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/loading.dart';
import 'package:new_fit/app/view/common/newfit_circle_avatar.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

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
    int scoreBoardLength = controller.scoreBoard.value.rankings?.length ?? 0;

    List<Widget> scoreboardList = List.generate(
      scoreBoardLength,
      (index) {
        /*if (index == 0) {
          return Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              if (scoreBoardLength == 1) onlyOne(),
              if (scoreBoardLength == 2) onlyTwo(),
              if (scoreBoardLength >= 3) moreThanThree(),
            ],
          );
        }*/
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
      },
    );

    scoreboardList.insert(
      0,
      Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: const NewfitTextBold2Xl(
                text: '전체 랭킹',
                textColor: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          if (scoreBoardLength == 1) onlyOne(),
          if (scoreBoardLength == 2) onlyTwo(),
          if (scoreBoardLength >= 3) moreThanThree(),
        ],
      ),
    );
    scoreboardList.insert(0, myRank());

    return scoreboardList;
  }

  Widget myRank() {
    Rank? userRankInfo = controller.scoreBoard.value.user_rank_info;

    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: const NewfitTextBold2Xl(
                text: '나의 랭크',
                textColor: AppColors.black,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          NewfitScoreboardListCell(
            rank: userRankInfo?.rank ?? 0,
            userNickName: userRankInfo?.nickname ?? '',
            credit: userRankInfo?.amount ?? 0,
            image: const Image(image: AssetImage(AppString.gorani)),
          ),
        ],
      ),
    );
  }

  Widget onlyOne() {
    return NewfitCircleAvatar(
      radius: 40.h,
      nickname: controller.scoreBoard.value.rankings?[0].nickname ?? '',
    );
  }

  Widget onlyTwo() {
    return Row(
      children: [
        NewfitCircleAvatar(
          radius: 40.h,
          nickname: controller.scoreBoard.value.rankings?[0].nickname ?? '',
        ),
        const Spacer(),
        NewfitCircleAvatar(
          radius: 40.h,
          nickname: controller.scoreBoard.value.rankings?[1].nickname ?? '',
        ),
      ],
    );
  }

  Widget moreThanThree() {
    return Stack(
      children: [
        Positioned(
          top: 80.h,
          width: 320.w,
          child: Row(
            children: [
              NewfitCircleAvatar(
                radius: 40.h,
                nickname: controller.scoreBoard.value.rankings_count! >= 3
                    ? (controller.scoreBoard.value.rankings?[2].nickname ?? '')
                    : '',
              ),
              const Spacer(),
              NewfitCircleAvatar(
                radius: 40.h,
                nickname: controller.scoreBoard.value.rankings_count! >= 2
                    ? (controller.scoreBoard.value.rankings?[1].nickname ?? '')
                    : '',
              ),
            ],
          ),
        ),
        NewfitCircleAvatar(
          radius: 50.h,
          nickname: controller.scoreBoard.value.rankings_count! >= 1
              ? (controller.scoreBoard.value.rankings?[0].nickname ?? '')
              : '',
        ),
        SizedBox(
          width: 360.w,
          height: 200.h,
        )
      ],
    );
  }
}
