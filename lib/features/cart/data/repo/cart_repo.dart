import 'package:aman_store2/core/api/error_handlier.dart';
import 'package:dartz/dartz.dart';

import '../models/p_cart_model/p_cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, PCartModel>> getCartItems();
  Future<Either<Failure, dynamic>> updateQuantity(
      {required int quantity, required int cartId});
  Future<Either<Failure, dynamic>> deleteFromCart({required int cartId});
  Future<Either<Failure, dynamic>> addORdeleteFaviore({required int itemId});
}
