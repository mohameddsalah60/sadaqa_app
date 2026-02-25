import 'package:flutter/material.dart';
import 'package:sadaqa_app/core/utils/app_colors.dart';

class AnimatedProgressIndicator extends StatelessWidget {
  final double value;

  const AnimatedProgressIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      builder: (context, val, _) {
        return CircularProgressIndicator(
          value: val,
          strokeWidth: 6,
          backgroundColor: AppColors.lightGrey,
          color: AppColors.blueLight,
        );
      },
    );
  }
}
