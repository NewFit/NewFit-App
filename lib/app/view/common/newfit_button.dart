import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

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
          child: NewfitTextBoldXl(
            text: buttonText,
            textColor: getTextColor(),
          ),
        ),
      ),
    );
  }
}

class NewfitTextButton extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final Function() onPressFunction;

  const NewfitTextButton({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.onPressFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressFunction,
      child: NewfitTextBoldXl(
        text: buttonText,
        textColor: textColor,
      ),
    );
  }
}

class NewfitLoginButton extends StatelessWidget {
  const NewfitLoginButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.buttonLeadingIcon,
    required this.onPressFuntion,
  });

  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final Widget buttonLeadingIcon;
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
                child: NewfitTextMediumMd(
                  text: buttonText,
                  textColor: buttonTextColor,
                ),
              )
            ],
          )),
    );
  }
}
