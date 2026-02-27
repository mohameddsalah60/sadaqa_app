import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

import '../../cubit/tasbeeh_cubit.dart';

class TasbeehCounterCard extends StatelessWidget {
  const TasbeehCounterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasbeehCubit, TasbeehState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 20.r),
          decoration: BoxDecoration(
            color: AppColors.primaryDark.withValues(alpha: .6),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'عداد التسبيح',
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    state.counter.toString(),
                    style: TextStyles.bold19.copyWith(
                      color: AppColors.blueLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
