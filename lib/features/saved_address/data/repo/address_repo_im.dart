import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/api/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/api/error_handlier.dart';
import '../model/address_model.dart';
import 'address_repo.dart';

class AddressRepoIm implements AddressRepo {
  final DioHelper dioHelper;

  AddressRepoIm({required this.dioHelper});

  @override
  Future<Either<Failure, List<AddressModel>>> getAddress() async {
    try {
      List<AddressModel> address = [];
      var response = await dioHelper.getData(endPoint: EndPoints.addresses);

      for (var item in response['data']['data']) {
        address.add(AddressModel.fromJson(item));
      }
      if (address.isEmpty) {
        return left(Diohandling('noAddress'.tr()));
      } else {
        return right(address);
      }
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}
