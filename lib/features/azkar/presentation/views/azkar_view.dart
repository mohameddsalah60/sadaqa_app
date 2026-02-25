import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadaqa_app/core/services/get_it_service.dart';
import 'package:sadaqa_app/features/azkar/domin/repos/azkar_repo.dart';
import 'package:sadaqa_app/features/azkar/presentation/cubit/azkar_cubit.dart';

import 'widgets/azkar_view_body.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});
  static const routeName = 'azkar';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(getIt<AzkarRepo>()),
      child: Scaffold(body: SafeArea(child: AzkarViewBody())),
    );
  }
}
