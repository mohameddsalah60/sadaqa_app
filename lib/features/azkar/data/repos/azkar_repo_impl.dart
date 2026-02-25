import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:sadaqa_app/core/services/azkar_api_service.dart';

import '../../../../core/errors/failures.dart';
import '../../domin/entites/azkar_entity.dart';
import '../../domin/repos/azkar_repo.dart';
import '../models/azkar_model.dart';

class AzkarRepoImpl extends AzkarRepo {
  final AzkarApiService azkarApiService;

  AzkarRepoImpl({required this.azkarApiService});
  @override
  Future<Either<Failure, List<AzkarCategoryEntity>>>
  getAzkarCategories() async {
    try {
      final response = await azkarApiService.getAzkar() as Map<String, dynamic>;

      final List dataList = response['data'];

      final categories =
          dataList.map((e) => AzkarCategoryModel.fromJson(e)).toList();

      return Right(categories);
    } catch (e) {
      log("Error in AzkarRepoImpl.getAzkarCategories: $e");
      return Left(ServerFailure("Repo Error: ${e.toString()}"));
    }
  }
}
