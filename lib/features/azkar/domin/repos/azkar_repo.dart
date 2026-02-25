import 'package:dartz/dartz.dart';
import 'package:sadaqa_app/core/errors/failures.dart';

import '../entites/azkar_entity.dart';

abstract class AzkarRepo {
  Future<Either<Failure, List<AzkarCategoryEntity>>> getAzkarCategories();
}
