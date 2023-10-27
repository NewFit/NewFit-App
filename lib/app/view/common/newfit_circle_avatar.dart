import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewfitCircleAvatar extends StatelessWidget {
  const NewfitCircleAvatar({
    required this.radius,
    super.key,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.h,
    );
  }
}
