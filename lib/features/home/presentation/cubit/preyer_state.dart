part of 'preyer_cubit.dart';

sealed class PreyerState {}

final class PreyerInitial extends PreyerState {}

final class PreyerLoading extends PreyerState {}

final class PreyerSuccess extends PreyerState {
  final List<PreyerEntity> prayerTimes;

  PreyerSuccess({required this.prayerTimes});
}

final class PreyerFailure extends PreyerState {
  final String errorMessage;

  PreyerFailure(this.errorMessage);
}
