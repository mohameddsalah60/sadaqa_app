// features/azkar/presentation/cubit/zekr_state.dart
part of 'zekr_cubit.dart';

sealed class ZekrState {}

final class ZekrInitial extends ZekrState {}

final class ZekrLoading extends ZekrState {}

final class ZekrCountUpdated extends ZekrState {
  final int index;
  final int currentCount;
  final int maxCount;

  ZekrCountUpdated({
    required this.index,
    required this.currentCount,
    required this.maxCount,
  });
}

final class ZekrPageChanged extends ZekrState {
  final int pageIndex;
  final int completedIndex;

  ZekrPageChanged({required this.pageIndex, required this.completedIndex});
}

final class ZekrResetAll extends ZekrState {}

final class ZekrError extends ZekrState {
  final String message;

  ZekrError({required this.message});
}
