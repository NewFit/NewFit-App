import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class NewfitImage extends StatelessWidget {
  const NewfitImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125.w,
      height: 125.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            child: const Image(
              image: AssetImage('images/gorani.png'),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.main,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
