import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_prayer.dart';
import 'date_today_widget.dart';
import 'my_location_text.dart';
import 'next_prayer_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              MyLocationText(),
              SizedBox(height: 16.h),
              DateTodayWidget(),
              SizedBox(height: 16.h),
              NextPrayerWidget(
                prayerName: 'العصر',
                prayerTime: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  19,
                  30,
                ),
              ),
              SizedBox(height: 16.h),
              CustomPrayer(prayerName: 'صلاة الظهر', prayerTime: '12:30 ص'),
            ],
          ),
        ),
      ),
    );
  }
}
