part of 'confirm_email_cubit.dart';

sealed class ConfirmEmailState {}

final class ConfirmEmailInitial extends ConfirmEmailState {}

final class ConfirmEmailLoading extends ConfirmEmailState {}

final class ConfirmEmailFailure extends ConfirmEmailState {
  final String errorMessage;

  ConfirmEmailFailure({required this.errorMessage});
}

final class ConfirmEmailSucsess extends ConfirmEmailState {}
