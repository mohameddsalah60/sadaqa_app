import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domin/entites/bottom_navigation_bar_entity.dart';
import 'active_item.dart';

class NavigationBarItemBottom extends StatelessWidget {
  const NavigationBarItemBottom({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarItem,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarItem;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
          decoration: ShapeDecoration(
            color: AppColors.softAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),
          child: ActiveItem(
            text: bottomNavigationBarItem.name,
            image: bottomNavigationBarItem.activeImage,
          ),
        )
        : ActiveItem(
          text: bottomNavigationBarItem.name,
          image: bottomNavigationBarItem.activeImage,
        );
  }
}
