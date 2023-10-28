import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_timepicker.dart';
import 'package:new_fit/app/view/main/test_page.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

class NewfitEquipmentListCell extends StatelessWidget {
  const NewfitEquipmentListCell({
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
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8.h, 0, 0),
      child: GestureDetector(
        onTap: () {
          //Todo : 테스트 용 페이지 이동. 지워야 함
          Get.to(TestPage());
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
                        image: AssetImage('images/test.png'),
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
              Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: AppColors.main,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '예약가능',
                        style: TextStyle(
                          color: AppColors.main,
                          fontWeight: AppFontWeights.extrabold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
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
                        tmpNewFitButton(),
                        Spacer(),
                        Text(
                          '~',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: AppFontWeights.extrabold,
                          ),
                        ),
                        Spacer(),
                        tmpNewFitButton(),
                      ],
                    ),
                  ),
                  //TODO: 여기까지
                  Spacer(),
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

class tmpNewFitButton extends StatelessWidget {
  const tmpNewFitButton({super.key});

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
