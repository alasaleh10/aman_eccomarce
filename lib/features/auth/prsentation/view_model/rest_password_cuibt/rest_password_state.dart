part of 'rest_password_cubit.dart';

sealed class RestPasswordState {}

final class RestPasswordInitial extends RestPasswordState {}

final class RestPasswordLoading extends RestPasswordState {}

final class RestPasswordFailure extends RestPasswordState {
  final String errorMessage;

  RestPasswordFailure({required this.errorMessage});
}

final class RestPasswordSucsess extends RestPasswordState {}
