part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

final class SignUpSucsess extends SignUpState {
  final SignUpModel signUpModel;

  SignUpSucsess({required this.signUpModel});
}
