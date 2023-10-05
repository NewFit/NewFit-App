import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class NewfitAppBarWithButton extends StatelessWidget
    implements PreferredSizeWidget {
  NewfitAppBarWithButton({
    super.key,
    required this.scrollController,
  });

  ScrollController scrollController;
  Rx<double> scrollPosition = 0.0.obs;
  late Widget creditInfo = creditInfoColumn();
  double appBarHeight = 183.h;

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(_scrollListener);

    return Obx(() {
      if (scrollPosition.value > 0.0) {
        appBarHeight = 105.h + MediaQuery.of(context).padding.top;
        creditInfo = const SizedBox();
      } else {
        appBarHeight = 175.h + MediaQuery.of(context).padding.top;
        creditInfo = creditInfoColumn();
      }
      return Container(
          height: appBarHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 25.r,
                offset: const Offset(0, 0),
              ),
            ],
            color: Colors.white,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userInfoAppBar(),
                  creditInfo,
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.center,
                    child: routineButton(),
                  )
                ],
              ),
            ),
          ));
    });
  }

  Widget userInfoAppBar() {
    return Row(children: [
      CircleAvatar(
        radius: 15.h,
      ),
      SizedBox(
        width: 10.w,
      ),
      Text("고라니 님"),
      const Spacer(),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings),
        iconSize: 24.w,
      )
    ]);
  }

  Widget creditInfoColumn() {
    return Column(
      children: [
        SizedBox(height: 13.h),
        Row(children: [
          Text(
            "전체 크레딧",
            style: TextStyle(fontSize: 12.sp),
          ),
          Text(
            "10000",
            style: TextStyle(fontSize: 12.sp),
          ),
        ]),
        SizedBox(height: 7.h),
        Row(
          children: [
            Text(
              "전체 크레딧",
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              "10000",
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Align(
          alignment: Alignment.center,
          child: creditProgressBar(),
        ),
      ],
    );
  }

  Widget creditProgressBar() {
    return SizedBox(
      width: 320.w,
      child: const LinearProgressIndicator(
        backgroundColor: Colors.black38,
        value: 0.5,
      ),
    );
  }

  Widget routineButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        width: 320.w,
        height: 40.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            elevation: MaterialStateProperty.all(0.0),
          ),
          child: Text("루틴으로 예약하기"),
        ),
      ),
    );
  }

  _scrollListener() {
    scrollPosition.value = scrollController.offset;
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
