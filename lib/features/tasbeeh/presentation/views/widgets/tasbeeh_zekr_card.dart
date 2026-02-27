import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubit/tasbeeh_cubit.dart';

class TasbeehZekrCard extends StatelessWidget {
  const TasbeehZekrCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasbeehCubit>();

    return BlocBuilder<TasbeehCubit, TasbeehState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 12.w),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.blueLight),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: state.currentZekr,
              isExpanded: true,
              dropdownColor: AppColors.primaryDark,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 28.r,
                color: AppColors.whiteColor,
              ),
              style: TextStyles.bold16.copyWith(color: AppColors.whiteColor),
              items:
                  cubit.azkar
                      .map(
                        (zekr) => DropdownMenuItem<String>(
                          value: zekr,
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.beads, width: 18.w),
                              SizedBox(width: 12.w),
                              Text(zekr),
                            ],
                          ),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                if (value != null) {
                  cubit.changeZekr(value);
                }
              },
              selectedItemBuilder: (context) {
                return cubit.azkar.map((zekr) {
                  return Row(
                    children: [
                      SvgPicture.asset(Assets.beads, width: 20.w),
                      SizedBox(width: 12.w),
                      Text(zekr),
                    ],
                  );
                }).toList();
              },
            ),
          ),
        );
      },
    );
  }
}
