import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/api/end_points.dart';
import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/features/auth/data/model/login_model.dart';
import 'package:aman_store2/features/auth/data/model/sign_up_class.dart';
import 'package:aman_store2/features/auth/data/model/sign_up_model.dart';
import 'package:aman_store2/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoIm implements AuthRepo {
  final DioHelper dioHelper;

  AuthRepoIm({required this.dioHelper});

  @override
  Future<Either<Failure, LoginModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: EndPoints.login,
          data: {'email': email, 'password': password});
     
      if (response['status'] == false) {
        return left(Diohandling(response['message']));
      } else {
        LoginModel loginModel = LoginModel.fromJson(response['data']);
        return right(loginModel);
      }
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignUpModel>> signUp(
      {required SignUpClass userData}) async {
    try {
      var response =
          await dioHelper.postData(endPoint: EndPoints.signup, data: {
        'name': userData.name,
        'email': userData.email,
        'phone': userData.phone,
        'password': userData.password
      });
      if (response['status'] == false) {
        return left(Diohandling(response['message']));
      } else {
        SignUpModel signUpModel = SignUpModel.fromJson(response['data']);
        return right(signUpModel);
      }
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}
