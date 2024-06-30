part of 'p_cart_cubit.dart';

sealed class PCartState {}

final class PCartInitial extends PCartState {}

final class PCartLoading extends PCartState {}

final class PCartSucsess2 extends PCartState {}

final class PCartSucess extends PCartState {
  final PCartModel carts;

  PCartSucess({required this.carts});
}

final class PCartFailure extends PCartState {
  final String message;

  PCartFailure({required this.message});
}

final class PCartMessage extends PCartState {
  final String message;

  PCartMessage({required this.message});
}
