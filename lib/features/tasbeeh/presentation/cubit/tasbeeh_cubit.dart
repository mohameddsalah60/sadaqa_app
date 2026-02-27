import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasbeeh_state.dart';

class TasbeehCubit extends Cubit<TasbeehState> {
  TasbeehCubit()
    : super(
        const TasbeehState(
          counter: 0,
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

    emit(
      state.copyWith(
        counter: newCounter,
        animationTick: state.animationTick + 1, // 🔥 trigger animation
      ),
    );
  }

  void reset() {
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
