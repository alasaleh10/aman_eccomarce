import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/features/auth/data/model/login_model.dart';
import 'package:aman_store2/features/auth/data/model/sign_up_class.dart';
import 'package:aman_store2/features/auth/data/model/sign_up_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(
      {required String email, required String password});
  Future<Either<Failure, SignUpModel>> signUp({required SignUpClass userData});
}
