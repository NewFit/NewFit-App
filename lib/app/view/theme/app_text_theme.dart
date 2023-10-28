// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

//app_theme이외의 텍스트 스타일이 필요할 때 여기 정의해주세요

class NewfitTextBoldMd extends StatelessWidget {
  const NewfitTextBoldMd({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class NewfitTextBoldLg extends StatelessWidget {
  const NewfitTextBoldLg({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: AppFontWeights.bold,
      ),
    );
  }
}

class NewfitTextBoldXl extends StatelessWidget {
  const NewfitTextBoldXl({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: AppFontWeights.bold,
      ),
    );
  }
}

class NewfitTextBold2Xl extends StatelessWidget {
  const NewfitTextBold2Xl({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 24,
        fontWeight: AppFontWeights.bold,
      ),
    );
  }
}

class NewfitTextBold3Xl extends StatelessWidget {
  const NewfitTextBold3Xl({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 30,
        fontWeight: AppFontWeights.bold,
      ),
    );
  }
}

class NewfitTextMediumMd extends StatelessWidget {
  const NewfitTextMediumMd({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: AppFontWeights.medium,
      ),
    );
  }
}

class NewfitTextRegularXs extends StatelessWidget {
  const NewfitTextRegularXs({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: AppFontWeights.regular,
      ),
    );
  }
}

class NewfitTextRegularMd extends StatelessWidget {
  const NewfitTextRegularMd({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: AppFontWeights.regular,
      ),
    );
  }
}

class NewfitTextRegularLg extends StatelessWidget {
  const NewfitTextRegularLg({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: AppFontWeights.regular,
      ),
    );
  }
}

class NewfitTextRegularXl extends StatelessWidget {
  const NewfitTextRegularXl({
    required this.text,
    required this.textColor,
    super.key,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: AppFontWeights.regular,
      ),
    );
  }
}
