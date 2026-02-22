import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadaqa_app/features/home/domin/repos/prayer_repo.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../azkar/presentation/views/azkar_view.dart';
import '../cubit/preyer_cubit.dart';
import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/home_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'homeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          BlocProvider(
            create:
                (context) => PreyerCubit(getIt<PrayerRepo>())..getPrayerTimes(),
            child: HomeViewBody(),
          ),
          AzkarView(),
        ],
      ),
    );
  }
}
