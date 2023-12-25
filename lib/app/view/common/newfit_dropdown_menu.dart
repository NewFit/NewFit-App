import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/data/model/menu/dropdown_constants.dart';

class NewfitDropDownMenu extends StatelessWidget {
  final void Function(String) routineDropdownChoiceAction;
  final List<MenuList> choices;

  const NewfitDropDownMenu({
    required this.choices,
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
        return choices.map((MenuList choice) {
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
