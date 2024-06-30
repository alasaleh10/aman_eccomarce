import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/api/end_points.dart';
import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/core/models/items_model.dart';
import 'package:aman_store2/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/models/categoriee_model.dart';
import '../models/banner_model.dart';

class HomeRepoIm implements HomeRepo {
  final DioHelper dioHelper;

  HomeRepoIm({required this.dioHelper});

  @override
  Future<Either<Failure, List>> getHomeData() async {
    List data = [];
    List<BannerModel> bannerList = [];
    List<ItemsModel> itemsList = [];
    List<ItemsModel> monthStock = [];
    List<CategorieeModel> categorisess = [];

    try {
      var response2 = await dioHelper.getData(endPoint: EndPoints.categoris);
      var response = await dioHelper.getData(endPoint: EndPoints.home);

      for (var categoriee in response2['data']['data']) {
        if (categorisess.length >= 4) {
          break;
        } else {
          categorisess.add(CategorieeModel.fromJson(categoriee));
        }
      }

      for (var banner in response['data']['banners']) {
        if (bannerList.length >= 5) {
          break;
        } else {
          bannerList.add(BannerModel.fromJson(banner));
        }
      }
      for (var item in response['data']['products']) {
        if (itemsList.length >= 6) {
          break;
        } else {
          itemsList.add(ItemsModel.fromJson(item));
        }
      }
      for (var item2 in response['data']['products']) {
        if (monthStock.length >= 4) {
          break;
        } else {
          if (!itemsList.contains(item2['id'])) {
            monthStock.add(ItemsModel.fromJson(item2));
          }
        }
      }
      data.insert(0, bannerList);
      data.insert(1, itemsList);
      data.insert(2, monthStock);
      data.insert(3, categorisess);

      return right(data);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ItemsModel>>> searchItem(
      {required String text}) async {
    List<ItemsModel> items = [];
    try {
      var response = await dioHelper
          .postData(endPoint: EndPoints.searchProduct, data: {'text': text});

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
  Future<Either<Failure, List<CategorieeModel>>> getAllCategorisee() async {
    try {
      List<CategorieeModel> categorisess = [];
      var response = await dioHelper.getData(endPoint: EndPoints.categoris);
      for (var item in response['data']['data']) {
        categorisess.add(CategorieeModel.fromJson(item));
      }
      return right(categorisess);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}
