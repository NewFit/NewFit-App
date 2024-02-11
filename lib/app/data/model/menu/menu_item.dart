import 'package:new_fit/app/data/model/enum/menu_code.dart';

class BottomNavItem {
  final String iconSVGName;
  final MenuCode menuCode;

  const BottomNavItem({
    required this.iconSVGName,
    required this.menuCode,
  });
}

class TabBarItem {
  final String tabBarTitle;
  final MenuCode menuCode;

  const TabBarItem({
    required this.tabBarTitle,
    required this.menuCode,
  });
}
