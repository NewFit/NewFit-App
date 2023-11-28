// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/reigster_gym_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';
import 'package:new_fit/app/view/common/newfit_text_field.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class RegisterGymPage extends BaseView<RegisterGymPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return BaseBodyWithNoScroll(
      screenPadding: 0,
      widgetList: [
        NewfitSearchTextField(
          textEditingController: controller.textEditingController,
          onSubmittedFunction: controller.getAddressGymList,
        ),
        SizedBox(
          height: 420.h,
          child: ListView.builder(
            itemCount: controller.addressGymList.gym_count,
            itemBuilder: (context, index) {
              return NewfitSearchListCell(
                gymTitleText: controller.addressGymList.gyms[index].gym_name,
                gymLocationText: controller.addressGymList.gyms[index].address,
              );
            },
          ),
        ),
        NewfitButton(
          buttonText: '등록 요청하기',
          buttonColor: AppColors.main,
          onPressFuntion: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: NewfitTextButton(
            buttonText: '다음에 할게요',
            textColor: Colors.grey,
            onPressFuntion: () {},
          ),
        ),
      ],
    );
  }
}
