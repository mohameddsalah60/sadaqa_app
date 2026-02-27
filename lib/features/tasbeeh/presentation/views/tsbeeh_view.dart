import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../cubit/tasbeeh_cubit.dart';
import 'widgets/tasbeeh_bottom_controls.dart';
import 'widgets/tasbeeh_button.dart';
import 'widgets/tasbeeh_counter_card.dart';
import 'widgets/tasbeeh_zekr_card.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasbeehCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TasbeehZekrCard(),
                SizedBox(height: 24.h),
                TasbeehCounterCard(),
                Spacer(),
                TasbeehButton(),
                Spacer(),
                TasbeehBottomControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
