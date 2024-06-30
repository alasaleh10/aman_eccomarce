part of 'account_cubit.dart';

sealed class AccountState {}

final class AccountInLoading extends AccountState {}

final class AccountFailure extends AccountState {
  final String message;

  AccountFailure({required this.message});
}

final class AccountInitial extends AccountState {}

final class AccountSucess extends AccountState {
  final LoginModel userData;

  AccountSucess({required this.userData});
}
