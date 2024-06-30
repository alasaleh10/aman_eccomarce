import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:aman_store2/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepo {
  Future<Either<Failure, LoginModel>> getUserProfile();
}
