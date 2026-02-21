import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubit/preyer_cubit.dart';
import 'prayer_countdown_timer.dart';

class NextPrayerWidget extends StatelessWidget {
  const NextPrayerWidget({
    super.key,
    required this.prayerName,
    required this.prayerTime,
  });
  final String prayerName;
  final DateTime prayerTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'باقي على أذان $prayerName',
                style: TextStyles.medium15.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: 8.h),
              PrayerCountdownTimer(
                targetTime: prayerTime,

                onFinished: () {
                  context.read<PreyerCubit>().updateNextPrayer();
                },
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Lottie.asset('assets/images/svg/loading.json', width: 130.w),
        ],
      ),
    );
  }
}
