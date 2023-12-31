import 'package:flutter/material.dart';

class MenuList {
  MenuList({
    required this.menuText,
    required this.menuIcon,
  });

  String menuText;
  Icon menuIcon;
}

class ReservationDropdownConstants {
  static MenuList cancel = MenuList(
    menuText: '취소',
    menuIcon: const Icon(
      Icons.delete,
      color: Colors.red,
    ),
  );

  static List<MenuList> choices = <MenuList>[cancel];
}

class RoutineDropdownConstants {
  static MenuList favorite = MenuList(
    menuText: '즐겨찾기',
    menuIcon: Icon(
      Icons.star,
      color: Colors.amber[600],
    ),
  );
  static MenuList edit = MenuList(
    menuText: '루틴 수정하기',
    menuIcon: const Icon(
      Icons.edit,
      color: Colors.black,
    ),
  );

  static MenuList delete = MenuList(
    menuText: '루틴 삭제하기',
    menuIcon: const Icon(
      Icons.delete,
      color: Colors.red,
    ),
  );

  static List<MenuList> choices = <MenuList>[favorite, edit, delete];
}
