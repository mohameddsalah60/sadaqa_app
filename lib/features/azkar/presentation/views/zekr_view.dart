import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadaqa_app/core/utils/app_text_styles.dart';
import 'package:sadaqa_app/features/azkar/domin/entites/azkar_entity.dart';
import '../../../../core/utils/app_colors.dart';

class ZekrView extends StatefulWidget {
  const ZekrView({super.key, required this.azkarList});

  final AzkarCategoryEntity azkarList;
  static const routeName = 'zekr';

  @override
  State<ZekrView> createState() => _ZekrViewState();
}

class _ZekrViewState extends State<ZekrView>
    with SingleTickerProviderStateMixin {
  late List<int> currentCounts;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentCounts = widget.azkarList.azkarList.map((e) => 0).toList();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.95,
      upperBound: 1.0,
    )..value = 1.0;

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _pageController = PageController();
  }

  void _onTap(int index) async {
    final maxCount = widget.azkarList.azkarList[index].count;

    if (currentCounts[index] < maxCount) {
      setState(() {
        currentCounts[index]++;
      });
    }

    // Animation effect
    await _controller.reverse();
    await _controller.forward();

    // لو وصل الحد الأقصى، انقل للذكر التالي
    if (currentCounts[index] >= maxCount) {
      if (index + 1 < widget.azkarList.azkarList.length) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.azkarList.name,
                style: TextStyles.semiBold19,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.whiteColor,
            size: 18.r,
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.azkarList.azkarList.length,
        itemBuilder: (context, index) {
          final zekr = widget.azkarList.azkarList[index];
          final maxCount = zekr.count;
          final progress = currentCounts[index] / maxCount;

          return Padding(
            padding: EdgeInsets.only(
              left: 16.0.r,
              right: 16.0.r,
              top: 16.0.r,
              bottom: 16.0.r,
            ),
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.primaryColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(6.r),
                  splashColor: AppColors.blueLight.withOpacity(.3),
                  highlightColor: AppColors.blueLight.withOpacity(.15),
                  onTap: () => _onTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: AppColors.blueLight,
                        width: .8.r,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // الذكر في النص
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              zekr.content,
                              textAlign: TextAlign.center,
                              style: TextStyles.semiBold16,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),

                        // المصدر تحت الذكر
                        if (zekr.description.isNotEmpty)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: Divider(
                                  color: AppColors.blueLight,
                                  thickness: .8.r,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  zekr.description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 24.h),

                        // العداد الكريتيف
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 80.w,
                                height: 80.w,
                                child: AnimatedCircularProgressIndicator(
                                  value: progress,
                                ),
                              ),
                              Text(
                                '${currentCounts[index]} / $maxCount',
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedCircularProgressIndicator extends StatelessWidget {
  final double value;

  const AnimatedCircularProgressIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value),
      duration: const Duration(milliseconds: 400),
      builder: (context, val, _) {
        return CircularProgressIndicator(
          value: val,
          strokeWidth: 6,
          backgroundColor: AppColors.lightGrey,
          color: AppColors.blueLight,
        );
      },
    );
  }
}
