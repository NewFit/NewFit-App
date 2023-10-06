import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/data/model/menu/dropdown_constants.dart';

class NewfitDropDownMenu extends StatelessWidget {
  const NewfitDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      onSelected: routineDropdownChoiceAction,
      itemBuilder: (BuildContext context) {
        return RoutineDropdownConstants.choices.map((MenuList choice) {
          return PopupMenuItem<String>(
            value: choice.menuText,
            child: Row(children: [
              choice.menuIcon,
              SizedBox(width: 5.w),
              Text(choice.menuText),
            ]),
          );
        }).toList();
      },
    );
  }
}
