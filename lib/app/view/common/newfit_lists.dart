// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class NewfitSearchListCell extends StatelessWidget {
  NewfitSearchListCell({
    required this.gymTitleText,
    required this.gymLocationText,
    required this.onTapFunction,
    required this.toggled,
    required this.toggledColor,
    super.key,
  });

  final String gymTitleText;
  final String gymLocationText;
  final Function() onTapFunction;
  final Color toggledColor;
  Rx<bool> toggled = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 56.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: toggledColor,
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 2.w,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    NewfitTextMediumMd(
                      text: gymTitleText,
                      textColor: AppColors.black,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 12.w,
                          color: AppColors.textUnabled,
                        ),
                        NewfitTextRegularMd(
                          text: gymLocationText,
                          textColor: AppColors.textUnabled,
                        )
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          toggled.value = !toggled.value;
          onTapFunction();
        },
      ),
    );
  }
}

class NewfitScoreboardListCell extends StatelessWidget {
  const NewfitScoreboardListCell({
    required this.rank,
    required this.userNickName,
    required this.credit,
    required this.image,
    super.key,
  });

  final int rank;
  final String userNickName;
  final int credit;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 320.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.h),
          border: Border.all(color: AppColors.grayDisabled),
        ),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 25.w, 0),
                child: NewfitTextMediumMd(
                    text: "$rank", textColor: AppColors.black)),
            const CircleAvatar(), // NewfitCircleAvatar 로 변경될 예정
            const Spacer(),
            NewfitTextMediumMd(
              text: userNickName,
              textColor: AppColors.black,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20.w, 0),
              child: NewfitTextRegularMd(
                  text: "$credit credit", textColor: AppColors.textUnabled),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class NewfitSettingListCell extends StatelessWidget {
  const NewfitSettingListCell({
    required this.settingTitle,
    required this.onPressedFunction,
    super.key,
  });

  final String settingTitle;
  final Function()? onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedFunction,
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              child: NewfitTextRegularLg(
                text: settingTitle,
                textColor: AppColors.black,
              ),
            ),
            const Spacer(),
            const Divider(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class NewfitToggleList extends StatelessWidget {
  const NewfitToggleList({
    required this.toggleText,
    required this.checked,
    super.key,
  });

  final String toggleText;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: checked ? AppColors.main : AppColors.unabledGrey,
              size: 24.h,
            ),
            SizedBox(
              width: 5.h,
            ),
            NewfitTextMediumMd(
              text: toggleText,
              textColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class NewfitReservationListCell extends StatelessWidget {
  const NewfitReservationListCell({
    required this.equipmentTitle,
    this.imageRoute = 'images/test.png',
    required this.currentStatus,
    super.key,
  });

  final String equipmentTitle;
  final String imageRoute;
  final int currentStatus;

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.find();

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8.h, 0, 0),
      child: GestureDetector(
        onTap: () {
          controller.navigateTo(
            route: Routes.HOME_RESERVATION,
          );
          //onPressFunc(context);
        },
        child: Container(
          width: 320.w,
          height: 60.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  offset: const Offset(0, 0),
                  spreadRadius: 0.1,
                  blurRadius: 20,
                ),
              ]),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(width: 3.w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image(
                        width: 64.w,
                        height: 50.h,
                        image: const AssetImage('images/test.png'),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      "gorani",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onPressFunc(BuildContext context) {
  showModalBottomSheet<dynamic>(
      enableDrag: true,
      context: context,
      backgroundColor: Colors.transparent,

      //backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: 1,
          maxChildSize: 1,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(28.w, 30.h, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '천국의 계단 1',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: AppFontWeights.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.h,
                    color: Colors.transparent,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 8.h, 0, 0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(50.h), // Image radius
                                child: const Image(
                                  image: AssetImage('images/gorani.png'),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //TODO : 여기 부분 수정
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0),
                    child: const Row(
                      children: [
                        TmpNewFitButton(),
                        Spacer(),
                        Text(
                          '~',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: AppFontWeights.extrabold,
                          ),
                        ),
                        Spacer(),
                        TmpNewFitButton(),
                      ],
                    ),
                  ),
                  //TODO: 여기까지
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
                    child: NewfitButton(
                        buttonText: '예약',
                        buttonColor: AppColors.main,
                        onPressFuntion: () {}),
                  )
                ],
              ),
            );
          },
        );
      });
}

class TmpNewFitButton extends StatelessWidget {
  const TmpNewFitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SizedBox(
        width: 130.w,
        height: 48.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(AppColors.sky100),
            elevation: MaterialStateProperty.all(0.0),
          ),
          child: Text(
            '5:00',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: AppFontWeights.semibold,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
