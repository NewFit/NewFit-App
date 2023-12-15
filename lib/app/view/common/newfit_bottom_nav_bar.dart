import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/newfit_bottom_nav_bar_controller.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/data/model/menu/menu_item.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

class NewfitBottomNavigationBar extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;
  NewfitBottomNavigationBar({Key? key, required this.onNewMenuSelected})
      : super(key: key);

  final navController = BottomNavController();

  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Color selectedItemColor = AppColors.main;
    Color unselectedItemColor = AppColors.black;
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => BottomNavigationBar(
        key: bottomNavKey,
        items: navItems
            .map(
              (BottomNavItem navItem) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  navItem.iconSVGName,
                  height: AppValues.iconDefaultSize,
                  width: AppValues.iconDefaultSize,
                  colorFilter: navItems.indexOf(navItem) ==
                          navController.selectedIndex
                      ? ColorFilter.mode(selectedItemColor, BlendMode.srcIn)
                      : ColorFilter.mode(unselectedItemColor, BlendMode.srcIn),
                ),
                label: "",
                tooltip: "",
              ),
            )
            .toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        currentIndex: navController.selectedIndex,
        onTap: (index) {
          navController.updateSelectedIndex(index);
          onNewMenuSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavItem> _getNavItems() {
    return [
      const BottomNavItem(
        iconSVGName: AppString.home,
        menuCode: MenuCode.HOME,
      ),
      const BottomNavItem(
        iconSVGName: AppString.reserve,
        menuCode: MenuCode.RESERVE,
      ),
      const BottomNavItem(
        iconSVGName: AppString.qr,
        menuCode: MenuCode.QR,
      ),
      const BottomNavItem(
        iconSVGName: AppString.mypage,
        menuCode: MenuCode.SCOREBOARD,
      ),
    ];
  }
}
