part of 'tasbeeh_cubit.dart';

class TasbeehState {
  final int counter;
  final int maxCount;
  final String currentZekr;

  final int animationTick;

  const TasbeehState({
    required this.counter,
    required this.maxCount,
    required this.currentZekr,
    required this.animationTick,
  });

  TasbeehState copyWith({
    int? counter,
    int? maxCount,
    String? currentZekr,
    int? animationTick,
  }) {
    return TasbeehState(
      counter: counter ?? this.counter,
      maxCount: maxCount ?? this.maxCount,
      currentZekr: currentZekr ?? this.currentZekr,
      animationTick: animationTick ?? this.animationTick,
    );
  }
}
