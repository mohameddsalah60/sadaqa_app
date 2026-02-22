import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomAzkarButton extends StatelessWidget {
  const CustomAzkarButton({
    super.key,
    required this.azkarName,
    required this.azkarIcon,
    this.onPressed,
  });
  final String azkarName;
  final IconData azkarIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(azkarIcon, color: AppColors.whiteColor, size: 16.r),
            SizedBox(width: 16.w),
            Text(
              azkarName,
              style: TextStyles.medium15.copyWith(color: AppColors.whiteColor),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.whiteColor,
              size: 16.r,
            ),
          ],
        ),
      ),
    );
  }
}
