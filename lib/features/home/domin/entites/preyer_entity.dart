class PreyerEntity {
  final String prayerName;
  final DateTime prayerTime;

  PreyerEntity({required this.prayerName, required this.prayerTime});

  String convertPrayerNameToArabic(String prayerName) {
    switch (prayerName) {
      case 'Fajr':
        return 'الفجر';
      case 'Dhuhr':
        return 'الظهر';
      case 'Asr':
        return 'العصر';
      case 'Maghrib':
        return 'المغرب';
      case 'Isha':
        return 'العشاء';
      default:
        return prayerName;
    }
  }
}
