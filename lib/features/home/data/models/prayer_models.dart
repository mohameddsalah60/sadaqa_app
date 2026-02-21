import 'package:sadaqa_app/features/home/domin/entites/preyer_entity.dart';

class PrayerModels extends PreyerEntity {
  PrayerModels({required super.prayerName, required super.prayerTime});

  static List<PrayerModels> fromJson(Map<String, dynamic> json) {
    final times = json['data']['times'] as Map<String, dynamic>;

    final now = DateTime.now();

    return times.entries
        .where(
          (e) =>
              e.key == 'Fajr' ||
              e.key == 'Dhuhr' ||
              e.key == 'Asr' ||
              e.key == 'Maghrib' ||
              e.key == 'Isha',
        )
        .map((entry) {
          final timeParts = entry.value.split(':');

          final prayerDateTime = DateTime(
            now.year,
            now.month,
            now.day,
            int.parse(timeParts[0]),
            int.parse(timeParts[1]),
          );

          return PrayerModels(
            prayerName: entry.key,
            prayerTime: prayerDateTime,
          );
        })
        .toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'prayerName': prayerName,
      'prayerTime': prayerTime.toIso8601String(),
    };
  }
}
