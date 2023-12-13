// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

class BaseBody extends StatelessWidget {
  final ScrollController? scrollController;
  final List<Widget> widgetList;
  double? columnHeight = 640.h;

  BaseBody({
    this.scrollController,
    required this.widgetList,
    this.columnHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
        width: double.infinity,
        child: SingleChildScrollView(
          controller: scrollController,
          child: SizedBox(
            height: columnHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widgetList,
            ),
          ),
        ),
      ),
    );
  }
}

class BaseBodyWithNoScroll extends StatelessWidget {
  final ScrollController? scrollController;
  final List<Widget> widgetList;
  double? screenPadding;

  BaseBodyWithNoScroll({
    this.scrollController,
    required this.widgetList,
    required this.screenPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenPadding!),
        width: double.infinity,
        child: SizedBox(
          height: 640.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}

class BaseBodyWithoutPadding extends StatelessWidget {
  final ScrollController? scrollController;
  final List<Widget> widgetList;
  double? columnHeight = 640.h;

  BaseBodyWithoutPadding({
    this.scrollController,
    required this.widgetList,
    this.columnHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          controller: scrollController,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widgetList,
            ),
          ),
        ),
      ),
    );
  }
}
