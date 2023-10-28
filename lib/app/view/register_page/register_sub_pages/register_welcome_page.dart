import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_textfield_with_category.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class RegisterWelcomePage extends BaseView<RegisterPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return Color(0xFFF2F4F6);
  }

  @override
  Widget body(BuildContext context) {
    return BaseBodyWithNoScroll(
      widgetList: [
        Spacer(),
        NewfitButton(
          buttonText: '환영합니다!',
          buttonColor: AppColors.main,
          onPressFuntion: () {},
        ),
      ],
    );
  }
}
