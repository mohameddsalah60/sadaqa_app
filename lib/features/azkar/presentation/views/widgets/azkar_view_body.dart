import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadaqa_app/core/utils/app_text_styles.dart';
import 'package:sadaqa_app/core/widgets/custom_text_field.dart';

import 'custom_azkar_button.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الابواب ومتن الاذكار', style: TextStyles.bold16),
            SizedBox(height: 16.h),
            CustomTextFromField(hintText: 'البحث في الابواب ومتن الاذكار'),
            SizedBox(height: 16.h),
            Column(
              children: List.generate(
                13,
                (index) => CustomAzkarButton(
                  azkarName: 'أذكار المساء',
                  azkarIcon: Icons.nightlight_round,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
