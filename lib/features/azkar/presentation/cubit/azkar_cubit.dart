import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadaqa_app/features/azkar/domin/repos/azkar_repo.dart';

import '../../domin/entites/azkar_entity.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this.azkarRepo) : super(AzkarInitial());

  final AzkarRepo azkarRepo;

  List<AzkarCategoryEntity> _allCategories = [];

  Future<void> getAzkarCategories() async {
    emit(AzkarLoading());

    final result = await azkarRepo.getAzkarCategories();

    result.fold(
      (failure) => emit(AzkarFailure(errorMessage: failure.errorMessage)),
      (categories) {
        _allCategories = categories;
        emit(AzkarSuccess(categories: categories));
      },
    );
  }

  void searchAzkar(String query) {
    final trimmedQuery = query.trim();

    if (trimmedQuery.isEmpty) {
      emit(AzkarSuccess(categories: _allCategories));
      return;
    }

    final lowerQuery = trimmedQuery.toLowerCase();

    final filtered =
        _allCategories.where((category) {
          return category.name.toLowerCase().contains(lowerQuery);
        }).toList();

    emit(AzkarSuccess(categories: filtered));
  }
}
