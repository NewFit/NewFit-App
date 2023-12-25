import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:new_fit/app/controller/unregister_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class UnregisterPage extends BaseView<UnregisterPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const NewfitAppBarFlat(
        appBarTitleText: NewfitTextBoldXl(
      text: AppString.str_feature_suggest_title,
      textColor: AppColors.black,
    ));
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(widgetList: []);
  }

  @override
  Widget? bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Obx(
          () => NewfitButton(
            buttonText: '제출',
            buttonColor: controller.canSubmit.value
                ? AppColors.main
                : AppColors.unabledGrey,
            onPressFuntion: () {
              if (controller.canSubmit.value) {}
            },
          ),
        ),
      ),
    );
  }
}
