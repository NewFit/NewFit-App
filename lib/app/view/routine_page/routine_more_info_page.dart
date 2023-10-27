import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/routine_more_info_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_routine_equipmentlist.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class RoutineMoreInfoPage extends BaseView<RoutineMoreInfoPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarTranparent(
        scrollController: scrollController, appBarTitleText: "루틴 상세 정보");
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      scrollController: scrollController,
      widgetList: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0.h),
          child: NewfitRoutineEquipmentListCell(
              listTitle: 'listTitle', minute: 10),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0.h),
          child: NewfitRoutineEquipmentListCell(
              listTitle: 'listTitle', minute: 10),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0.h),
          child: NewfitRoutineEquipmentListCell(
              listTitle: 'listTitle', minute: 10),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0.h),
          child: NewfitRoutineEquipmentListCell(
              listTitle: 'listTitle', minute: 10),
        ),
      ],
    );
  }

  @override
  Widget bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.h, bottom: 20.h, left: 30.h, right: 30.h),
        child: NewfitButton(
          buttonText: '루틴 수정하기',
          buttonColor: AppColors.main,
          onPressFuntion: () {},
        ),
      ),
    );
  }
}
