// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/loading.dart';
import 'package:new_fit/app/view/common/newfit_equipment_list.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class HomePage extends BaseView<HomePageController> with StorageUtil {
  final ScrollController scrollController;

  HomePage({required this.scrollController});

  List<Widget> buildEquipmentList(EquipmentList? equipmentList) {
    List<Widget> list = <Widget>[];

    if (equipmentList == null) {
      return list;
    }

    list = List<Widget>.generate(
      equipmentList.equipments!.length,
      (index) {
        final equipment = equipmentList.equipments![index];
        return NewfitEquipmentListCell(
          equipmentTitle: equipment.equipment_gym_name,
          currentStatus:
              equipment.condition == AppString.equipment_condition_available
                  ? 1
                  : 0,
          equipmentId: equipment.equipment_id,
          equipmentGymId: equipment.equipment_gym_id,
        );
      },
    );

    list.insert(0, SizedBox(height: 5.h));
    list.insert(
      0,
      Row(
        children: [
          Container(
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.grayDisabled,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Column(children: [
                const Spacer(),
                Text(
                  '헬스장',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: AppFontWeights.medium,
                  ),
                ),
                const Spacer(),
              ]),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.main,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Column(children: [
                  const Spacer(),
                  Text(
                    '루틴으로 예약하기',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const Spacer(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
    list.insert(0, SizedBox(height: 15.h));

    return list;
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      scrollController: scrollController,
      widgetList: [
        Stack(
          children: [
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
                      children: (getInt(AppString.key_authority_id) != 0 &&
                              getInt(AppString.key_authority_id) != null)
                          ? buildEquipmentList(controller.equipmentList.value)
                          : [
                              SizedBox(
                                height: 100.h,
                              ),
                              const NewfitTextRegularXl(
                                text: '헬스장 등록이 수락되지 않았어요.',
                                textColor: Colors.grey,
                              ),
                            ],
                    );
                  case ConnectionState.none:
                    return const Loading();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
