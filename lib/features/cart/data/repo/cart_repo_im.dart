import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/api/end_points.dart';
import 'package:aman_store2/core/api/error_handlier.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/p_cart_model/p_cart_model.dart';
import 'cart_repo.dart';

class CartRepoIm implements CartRepo {
  final DioHelper dio;

  CartRepoIm({required this.dio});
  @override
  Future<Either<Failure, PCartModel>> getCartItems() async {
    try {
      var response = await dio.getData(endPoint: EndPoints.cart);
      PCartModel pCartModel = PCartModel.fromJson(response['data']);
      return right(pCartModel);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateQuantity(
      {required int quantity, required int cartId}) async {
    try {
      var response = await dio.editData(
          endPoint: '${EndPoints.cart}/$cartId', data: {'quantity': quantity});
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

  @override
  Future<Either<Failure, dynamic>> deleteFromCart({required int cartId}) async {
    try {
      var response =
          await dio.deleteData(endPoint: '${EndPoints.cart}/$cartId');
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

  @override
  Future<Either<Failure, dynamic>> addORdeleteFaviore(
      {required int itemId}) async {
    try {
      var response = await dio.postData(
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
