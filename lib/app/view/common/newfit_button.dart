import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: Text(buttonText),
        ),
      ),
    );
    ;
  }
}
