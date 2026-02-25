import 'package:flutter/material.dart';
import 'package:sadaqa_app/features/azkar/domin/entites/azkar_entity.dart';

import '../../features/azkar/presentation/views/azkar_view.dart';
import '../../features/azkar/presentation/views/zekr_view.dart';
import '../../features/home/presentation/views/home_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case AzkarView.routeName:
      return MaterialPageRoute(builder: (context) => const AzkarView());
    case ZekrView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => ZekrView(
              azkarCategory: routeSettings.arguments as AzkarCategoryEntity,
            ),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
