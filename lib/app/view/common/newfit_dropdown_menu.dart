import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/data/model/menu/dropdown_constants.dart';

class NewfitDropDownMenu extends StatelessWidget {
  final void Function(String) routineDropdownChoiceAction;

  const NewfitDropDownMenu({
    required this.routineDropdownChoiceAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
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
