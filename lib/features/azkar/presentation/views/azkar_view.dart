import 'package:flutter/material.dart';

import 'widgets/azkar_view_body.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});
  static const routeName = 'azkar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: AzkarViewBody()));
  }
}
