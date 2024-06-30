import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/features/favorite/data/models/faviort_model/faviort_model.dart';
import 'package:dartz/dartz.dart';

abstract class FaviorteRepo {
  Future<Either<Failure, List<FaviortModel>>> getFaviort();
  Future<Either<Failure, dynamic>> deleteFaviort({required int itemId});
}
