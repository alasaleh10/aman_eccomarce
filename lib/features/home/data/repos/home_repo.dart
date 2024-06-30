import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/core/models/items_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/categoriee_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<dynamic>>> getHomeData();
  Future<Either<Failure, List<ItemsModel>>> searchItem({required String text});
  Future<Either<Failure, List<CategorieeModel>>> getAllCategorisee();
}
