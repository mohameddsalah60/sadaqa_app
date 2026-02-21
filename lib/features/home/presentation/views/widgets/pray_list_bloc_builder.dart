import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/preyer_cubit.dart';
import 'custom_prayer.dart';

class PrayListBlocBuilder extends StatelessWidget {
  const PrayListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreyerCubit, PreyerState>(
      builder: (context, state) {
        if (state is PreyerLoading) {
          return Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withValues(alpha: .2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          );
        } else if (state is PreyerSuccess) {
          final prayers = state.prayerTimes;
          return Column(
            children: List.generate(
              prayers.length,
              (index) => CustomPrayer(
                color:
                    context.read<PreyerCubit>().nextPrayer!.prayerName ==
                            prayers[index].prayerName
                        ? AppColors.blueLight
                        : AppColors.primaryDark,
                prayerName: prayers[index].convertPrayerNameToArabic(
                  prayers[index].prayerName,
                ),
                prayerTime: prayers[index].prayerTime,
              ),
            ),
          );
        } else if (state is PreyerFailure) {
          return Text(state.errorMessage);
        } else {
          return Text('Failed to load prayer times');
        }
      },
    );
  }
}
