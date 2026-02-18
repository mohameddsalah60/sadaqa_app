import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomPrayer extends StatelessWidget {
  const CustomPrayer({
    super.key,
    required this.prayerName,
    required this.prayerTime,
    this.color = AppColors.primaryDark,
  });
  final String prayerName, prayerTime;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'صلاة الظهر',
            style: TextStyles.medium15.copyWith(color: AppColors.whiteColor),
          ),
          SizedBox(height: 8.h),
          Text(
            '12:30 ص',
            maxLines: 1,
            style: TextStyles.semiBold16.copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
