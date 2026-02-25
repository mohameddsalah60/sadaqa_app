// features/azkar/presentation/views/zekr_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domin/entites/azkar_entity.dart';
import '../cubits/zekr_cubit/zekr_cubit.dart';
import 'widgets/zekr_app_bar.dart';
import 'widgets/zekr_content_card.dart';

class ZekrView extends StatefulWidget {
  const ZekrView({super.key, required this.azkarCategory});

  final AzkarCategoryEntity azkarCategory;
  static const String routeName = 'zekr-view';

  @override
  State<ZekrView> createState() => _ZekrViewState();
}

class _ZekrViewState extends State<ZekrView> with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.95,
      upperBound: 1.0,
    )..value = 1.0;

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  Future<void> _handleTap(int index, ZekrCubit cubit) async {
    cubit.incrementCount(index);

    // تشغيل animation
    await _scaleController.reverse();
    await _scaleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ZekrCubit(azkarList: widget.azkarCategory.azkarList),
      child: BlocConsumer<ZekrCubit, ZekrState>(
        listener: (context, state) {
          if (state is ZekrPageChanged) {
            _pageController.animateToPage(
              state.pageIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else if (state is ZekrError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = context.read<ZekrCubit>();

          if (state is ZekrLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            appBar: ZekrAppBar(title: widget.azkarCategory.name),
            body: PageView.builder(
              controller: _pageController,
              itemCount: cubit.azkarList.length,
              onPageChanged: cubit.setPageIndex,
              itemBuilder: (context, index) {
                final zekr = cubit.azkarList[index];
                final progress = cubit.getProgressForIndex(index);
                final currentCount = cubit.currentCounts[index];
                final maxCount = zekr.count;

                return ScaleTransition(
                  scale: _scaleAnimation,
                  child: ZekrContentCard(
                    zekr: zekr,
                    progress: progress,
                    currentCount: '$currentCount / $maxCount',
                    onTap: () => _handleTap(index, cubit),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
