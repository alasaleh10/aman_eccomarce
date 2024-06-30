import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/api/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/api/error_handlier.dart';
import '../models/faviort_model/faviort_model.dart';
import 'faviort_repo.dart';

class FaviorteRepoIm implements FaviorteRepo {
  final DioHelper dioHelper;

  FaviorteRepoIm({required this.dioHelper});
  @override
  Future<Either<Failure, List<FaviortModel>>> getFaviort() async {
    try {
      List<FaviortModel> faviort = [];

      var response = await dioHelper.getData(endPoint: EndPoints.faviortte);
      for (var item in response['data']['data']) {
        faviort.add(FaviortModel.fromJson(item));
      }
      if (faviort.isEmpty) {
        return left(Diohandling('noProducts'.tr()));
      } else {
        return right(faviort);
      }
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteFaviort({required int itemId}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: EndPoints.faviortte, data: {'product_id': itemId});
      if (response['status'] == false) {
        return left(Diohandling('failed'.tr()));
      } else {
        return right(true);
      }
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}
