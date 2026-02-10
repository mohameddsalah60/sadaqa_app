import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadaqa_app/core/utils/app_colors.dart';

void main() {
  runApp(const SadaqaApp());
}

class SadaqaApp extends StatelessWidget {
  const SadaqaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldColor,
            fontFamily: 'Cairo',
          ),
          home: Scaffold(body: Text("data")),
        );
      },
    );
  }
}
