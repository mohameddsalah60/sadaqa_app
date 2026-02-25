part of 'azkar_cubit.dart';

sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarSuccess extends AzkarState {
  final List<AzkarCategoryEntity> categories;

  AzkarSuccess({required this.categories});
}

final class AzkarFailure extends AzkarState {
  final String errorMessage;

  AzkarFailure({required this.errorMessage});
}
