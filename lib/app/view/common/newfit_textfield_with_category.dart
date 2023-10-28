import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/common/newfit_text_field.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class NewfitTextfieldWithTitle extends StatelessWidget {
  const NewfitTextfieldWithTitle({
    required this.titleText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  final String titleText;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: NewfitTextRegularXl(
                text: titleText, textColor: AppColors.black)),
        SizedBox(
          height: 5.h,
        ),
        NewfitIdInputTextField(
          hintText: hintText,
          controller: controller,
        )
      ],
    );
  }
}
