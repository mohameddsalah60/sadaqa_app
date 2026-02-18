import 'package:hijri/hijri_calendar.dart';

String getArabicDayAndMonth() {
  final now = DateTime.now();

  const arabicDays = [
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];

  const arabicMonths = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  const hijriMonths = [
    'محرم',
    'صفر',
    'ربيع الأول',
    'ربيع الآخر',
    'جمادى الأولى',
    'جمادى الآخرة',
    'رجب',
    'شعبان',
    'رمضان',
    'شوال',
    'ذو القعدة',
    'ذو الحجة',
  ];

  final dayName = arabicDays[now.weekday - 1];
  final monthName = arabicMonths[now.month - 1];

  final hijri = HijriCalendar.fromDate(now);
  final hijriMonthName = hijriMonths[hijri.hMonth - 1];

  return "$dayName ${now.day} $monthName • "
      "${hijri.hDay} $hijriMonthName ${hijri.hYear}";
}
