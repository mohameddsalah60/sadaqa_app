import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_arabic_day_and_month.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DateTodayWidget extends StatelessWidget {
  const DateTodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getArabicDayAndMonth(),
          style: TextStyles.semiBold13.copyWith(color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
