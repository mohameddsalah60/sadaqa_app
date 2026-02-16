import 'package:flutter/material.dart';
import 'package:sadaqa_app/core/utils/app_colors.dart';

import '../../domin/entites/bottom_navigation_bar_entity.dart';
import 'navigation_bar_item_bottom.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .08,
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 10,
            color: Color(0x19000000),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children:
            bottomNavigationBarItem.asMap().entries.map((e) {
              var index = e.key;
              var entity = e.value;
              return Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => onTap(index),
                  child: NavigationBarItemBottom(
                    isSelected: currentIndex == index,
                    bottomNavigationBarItem: entity,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
