import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage;
  final String name;

  BottomNavigationBarEntity({required this.activeImage, required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItem => [
  BottomNavigationBarEntity(activeImage: Assets.mosque, name: 'الرئيسية'),
  BottomNavigationBarEntity(activeImage: Assets.muslim, name: 'الاذكار'),
  BottomNavigationBarEntity(activeImage: Assets.qibla, name: 'القبلة'),
  BottomNavigationBarEntity(activeImage: Assets.beads, name: 'السبحة'),
];
