import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/tasbeeh_cubit.dart';

class TasbeehBottomControls extends StatelessWidget {
  const TasbeehBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasbeehCubit>();

    return BlocBuilder<TasbeehCubit, TasbeehState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ControlCard(
              onTap: cubit.reset,
              child: const Icon(
                Icons.refresh,
                color: AppColors.softAccent,
                size: 26,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ControlCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _ControlCard({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.blueLight),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withValues(alpha: .25),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
