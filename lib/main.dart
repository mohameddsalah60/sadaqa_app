import 'package:flutter/material.dart';
import 'package:sadaqa_app/core/utils/app_colors.dart';

void main() {
  runApp(const SadaqaApp());
}

class SadaqaApp extends StatelessWidget {
  const SadaqaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldColor),
      home: Scaffold(body: Text("data")),
    );
  }
}
