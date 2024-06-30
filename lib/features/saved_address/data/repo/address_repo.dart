import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:dartz/dartz.dart';

import '../model/address_model.dart';

abstract class AddressRepo
{
  Future<Either<Failure,List<AddressModel>>> getAddress();
} 