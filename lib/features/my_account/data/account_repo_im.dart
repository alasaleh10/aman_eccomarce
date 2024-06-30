import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/api/end_points.dart';
import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/features/auth/data/model/login_model.dart';
import 'package:aman_store2/features/my_account/data/account_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AccountRepoIm implements AccountRepo {
  final DioHelper dioHelper;

  AccountRepoIm({required this.dioHelper});

  @override
  Future<Either<Failure, LoginModel>> getUserProfile() async {
    try {
      var response = await dioHelper.getData(endPoint: EndPoints.profile);

      LoginModel loginModel = LoginModel.fromJson(response['data']);

      return right(loginModel);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}
