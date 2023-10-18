import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

import '../theme/app_text_theme.dart';

class NewfitButton extends StatelessWidget {
  const NewfitButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressFuntion,
  });

  final String buttonText;
  final Color buttonColor;
  final Function() onPressFuntion;

  Color getTextColor() {
    double luminance = buttonColor.computeLuminance();

    if (luminance > 0.5) {
      return AppColors.textBlack;
    } else {
      return AppColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SizedBox(
        width: 320.w,
        height: 40.h,
        child: ElevatedButton(
          onPressed: onPressFuntion,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            elevation: MaterialStateProperty.all(0.0),
          ),
          child: NewfitTextBoldLg(text: buttonText, textColor: getTextColor(),),
        ),
      ),
    );
  }
}

class NewfitLoginButton extends StatelessWidget {
  const NewfitLoginButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonLeadingIcon,
    required this.onPressFuntion,
  });

  final String buttonText;
  final Color buttonColor;
  final Icon buttonLeadingIcon;
  final Function() onPressFuntion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      height: 40.h,
      child: ElevatedButton(
          onPressed: onPressFuntion,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            elevation: MaterialStateProperty.all(0.0),
          ),
          child: Stack(
            children: [
              Align(alignment: Alignment.centerLeft, child: buttonLeadingIcon),
              Center(
                child: Text(buttonText),
              )
            ],
          )),
    );
  }
}
