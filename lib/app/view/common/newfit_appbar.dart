import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class NewfitAppBar extends StatelessWidget implements PreferredSizeWidget {
  NewfitAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 25,
              offset: Offset(0, 0),
            ),
          ],
          color: Colors.white,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  Text("고라니 님"),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                  )
                ]),
                Row(children: [
                  Text("전체 크레딧"),
                  Text("10000"),
                ]),
                Row(children: [
                  Text("일일 크레딧"),
                  Text("75/100"),
                ]),
                Container(
                  width: 300.w,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.black38,
                    value: 0.1,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("button"),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(183);
}
