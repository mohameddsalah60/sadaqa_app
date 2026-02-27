import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubit/tasbeeh_cubit.dart';

class TasbeehButton extends StatefulWidget {
  const TasbeehButton({super.key});

  @override
  State<TasbeehButton> createState() => _TasbeehButtonState();
}

class _TasbeehButtonState extends State<TasbeehButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.92,
      upperBound: 1,
    )..value = 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TasbeehCubit, TasbeehState>(
      listenWhen: (p, c) => p.animationTick != c.animationTick,
      listener: (context, state) {
        _controller.reverse().then((_) => _controller.forward());
      },
      child: GestureDetector(
        onTap: () => context.read<TasbeehCubit>().tasbeeh(),
        child: ScaleTransition(
          scale: _controller,
          child: Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                colors: [AppColors.primaryExtraLight, AppColors.primaryDark],
              ),
              border: Border.all(color: AppColors.blueLight, width: 3),
            ),
            child: Center(
              child: Text(
                'سبّح',
                style: TextStyles.bold28.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
