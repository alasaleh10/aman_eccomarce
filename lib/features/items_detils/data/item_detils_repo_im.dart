import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/api/end_points.dart';
import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/core/models/items_model.dart';
import 'package:aman_store2/features/items_detils/data/item_detils_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class ItemDetilsRepoIm implements ItemDetilsRepo {
  final DioHelper dioHelper;

  ItemDetilsRepoIm({required this.dioHelper});

  @override
  Future<Either<Failure, ItemsModel>> getItemDetils(
      {required int itemId}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: '${EndPoints.productDetils}$itemId');
      if (response['status'] == false) {
        return left(Diohandling(response['message']));
      } else {
        ItemsModel itemsModel = ItemsModel.fromJson(response['data']);
        return right(itemsModel);
      }
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ItemsModel>>> getCategorieeItems(
      {required int catId}) async {
    try {
      List<ItemsModel> items = [];
      var response =
          await dioHelper.getData(endPoint: '${EndPoints.categoris}/$catId');
      for (var item in response['data']['data']) {
        items.add(ItemsModel.fromJson(item));
      }
      if (items.isEmpty) {
        return left(Diohandling('noProducts'.tr()));
      } else {
        return right(items);
      }
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
  
@override
  Future<Either<Failure, dynamic>> addORdeleteCart(
      {required int itemId}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: EndPoints.cart, data: {'product_id': itemId});
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
