// features/azkar/presentation/widgets/zekr_content_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadaqa_app/core/utils/app_colors.dart';
import 'package:sadaqa_app/core/utils/app_text_styles.dart';
import 'package:sadaqa_app/features/azkar/domin/entites/azkar_entity.dart';
import 'package:share_plus/share_plus.dart';

import 'animated_progress_indicator.dart';

class ZekrContentCard extends StatelessWidget {
  final AzkarEntity zekr;
  final double progress;
  final String currentCount;
  final VoidCallback onTap;

  const ZekrContentCard({
    super.key,
    required this.zekr,
    required this.progress,
    required this.currentCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: ScaleTransition(
        scale: _createScaleAnimation(),
        child: Material(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.primaryColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(6.r),
            splashColor: AppColors.blueLight.withValues(alpha: .3),
            highlightColor: AppColors.blueLight.withValues(alpha: .15),
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColors.blueLight, width: .8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContent(),
                  SizedBox(height: 24.h),
                  if (zekr.description.isNotEmpty) _buildDescription(),
                  _buildCounter(),
                  SizedBox(height: 24.h),
                  GestureDetector(
                    onTap: () {
                      String shareText = '📿\n\n';
                      shareText += '\n${zekr.content}\n\n';

                      if (zekr.description.isNotEmpty) {
                        shareText += '\n${zekr.description}\n\n';
                      }

                      shareText += '**عدد المرات:** ${zekr.count}\n';
                      shareText += '🔹 شارك الأجر مع أحبابك 🔹';

                      SharePlus.instance.share(
                        ShareParams(
                          text: shareText,
                          subject: 'ذكر من تطبيق صدقة',
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16.r),
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: AppColors.blueLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'مشاركة',
                        textAlign: TextAlign.center,
                        style: TextStyles.medium15.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          zekr.content,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Divider(color: AppColors.blueLight, thickness: .8.r),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            zekr.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: AppColors.whiteColor),
          ),
        ),
      ],
    );
  }

  Widget _buildCounter() {
    return Column(
      children: [
        SizedBox(height: 36.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100.w,
                height: 100.w,
                child: AnimatedProgressIndicator(value: progress),
              ),
              Text(
                currentCount,
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
    );
  }

  _createScaleAnimation() {
    return const AlwaysStoppedAnimation(1.0);
  }
}
