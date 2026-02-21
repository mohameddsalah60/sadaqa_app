import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadaqa_app/features/home/presentation/cubit/preyer_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class MyLocationText extends StatelessWidget {
  const MyLocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.watch<PreyerCubit>().placeUser,
          style: TextStyles.semiBold16.copyWith(color: AppColors.whiteColor),
        ),
        SizedBox(width: 4.w),
        Icon(Icons.near_me, color: AppColors.accentColor, size: 16.sp),
      ],
    );
  }
}
