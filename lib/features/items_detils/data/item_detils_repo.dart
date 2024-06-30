import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/core/models/items_model.dart';
import 'package:dartz/dartz.dart';

abstract class ItemDetilsRepo {
  Future<Either<Failure, ItemsModel>> getItemDetils({required int itemId});
  Future<Either<Failure, dynamic>> addORdeleteCart({required int itemId});

  Future<Either<Failure, List<ItemsModel>>> getCategorieeItems(
      {required int catId});
}
