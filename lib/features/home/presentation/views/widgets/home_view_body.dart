import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'date_today_widget.dart';
import 'my_location_text.dart';
import 'next_pray_bloc_builder.dart';
import 'pray_list_bloc_builder.dart';

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
              NextPrayBlocBuilder(),
              SizedBox(height: 16.h),
              PrayListBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
