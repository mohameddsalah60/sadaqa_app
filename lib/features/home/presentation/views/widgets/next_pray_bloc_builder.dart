import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/preyer_cubit.dart';
import 'next_prayer_widget.dart';

class NextPrayBlocBuilder extends StatelessWidget {
  const NextPrayBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreyerCubit, PreyerState>(
      builder: (context, state) {
        if (state is PreyerSuccess) {
          final nextPrayer = context.watch<PreyerCubit>().nextPrayer;
          return NextPrayerWidget(
            prayerName: nextPrayer!.convertPrayerNameToArabic(
              nextPrayer.prayerName,
            ),

            prayerTime: nextPrayer.prayerTime,
          );
        }

        return Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryDark.withValues(alpha: .2),
            borderRadius: BorderRadius.circular(16.r),
          ),
        );
      },
    );
  }
}
