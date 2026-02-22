import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class PrayerCountdownTimer extends StatefulWidget {
  final DateTime targetTime;
  final VoidCallback onFinished;

  const PrayerCountdownTimer({
    super.key,
    required this.targetTime,
    required this.onFinished,
  });

  @override
  State<PrayerCountdownTimer> createState() => _PrayerCountdownTimerState();
}

class _PrayerCountdownTimerState extends State<PrayerCountdownTimer> {
  late Duration remaining;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    remaining = widget.targetTime.difference(DateTime.now());

    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final diff = widget.targetTime.difference(DateTime.now());

      /// لو الوقت خلص أو فات
      if (diff.isNegative || diff.inSeconds <= 0) {
        timer?.cancel();

        // متحدثش حالة الـ widget
        setState(() {
          remaining = const Duration();
        });

        // استنى 1 ثانية عشان الساعة تضبط
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            widget.onFinished();
          }
        });

        return;
      }

      setState(() {
        remaining = diff;
      });
    });
  }

  /// لو الصلاة الجاية اتغيرت
  @override
  void didUpdateWidget(covariant PrayerCountdownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.targetTime != widget.targetTime) {
      timer?.cancel();

      remaining = widget.targetTime.difference(DateTime.now());

      _startTimer();
    }
  }

  String _format(Duration duration) {
    final hours = duration.inHours;

    final minutes = duration.inMinutes.remainder(60);

    final seconds = duration.inSeconds.remainder(60);

    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _format(remaining),
      maxLines: 1,
      style: TextStyles.semiBold16.copyWith(
        color: AppColors.whiteColor,
        fontSize: 32.sp,
      ),
    );
  }
}
