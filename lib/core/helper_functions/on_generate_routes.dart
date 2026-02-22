import 'package:flutter/material.dart';

import '../../features/azkar/presentation/views/azkar_view.dart';
import '../../features/home/presentation/views/home_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case AzkarView.routeName:
      return MaterialPageRoute(builder: (context) => const AzkarView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
