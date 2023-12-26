// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class NewfitImage extends StatelessWidget {
  final double width;
  final double height;
  String imagePath;

  NewfitImage({
    super.key,
    required this.width,
    required this.height,
    this.imagePath = 'images/gorani.png',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              child: Image(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.main,
                width: 1.5.w,
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
