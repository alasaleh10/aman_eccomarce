part of 'cheek_email_cubit.dart';

sealed class CheekEmailState {}

final class CheekEmailInitial extends CheekEmailState {}

final class CheekEmailLoading extends CheekEmailState {}

final class CheekEmailFailure extends CheekEmailState {
  final String errorMessage;

  CheekEmailFailure({required this.errorMessage});
}

final class CheekEmailSucsess extends CheekEmailState {}
