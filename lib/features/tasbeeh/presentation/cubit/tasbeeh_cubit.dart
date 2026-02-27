import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadaqa_app/core/services/shared_preferences_service.dart';

part 'tasbeeh_state.dart';

class TasbeehCubit extends Cubit<TasbeehState> {
  TasbeehCubit()
    : super(
        TasbeehState(
          counter: (SharedPreferencesService.getInt('counter') ?? 0),
          maxCount: 9999999999,
          currentZekr: 'سبحان الله',
          animationTick: 0,
        ),
      );

  final List<String> azkar = const [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  void tasbeeh() {
    HapticFeedback.lightImpact();

    final newCounter = state.counter < state.maxCount ? state.counter + 1 : 0;
    SharedPreferencesService.setData(key: 'counter', value: newCounter);
    emit(
      state.copyWith(
        counter: newCounter,
        animationTick: state.animationTick + 1,
      ),
    );
  }

  void reset() {
    SharedPreferencesService.setData(key: 'counter', value: 0);
    emit(state.copyWith(counter: 0, animationTick: state.animationTick + 1));
  }

  void changeMaxCount(int value) {
    emit(
      state.copyWith(
        maxCount: value,
        counter: 0,
        animationTick: state.animationTick + 1,
      ),
    );
  }

  void changeZekr(String zekr) {
    emit(
      state.copyWith(
        currentZekr: zekr,
        counter: 0,
        animationTick: state.animationTick + 1,
      ),
    );
  }
}
