import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rest_password_state.dart';

class RestPasswordCubit extends Cubit<RestPasswordState> {
  RestPasswordCubit() : super(RestPasswordInitial());
  final key = GlobalKey<FormState>();
  final password1 = TextEditingController();
  final password2 = TextEditingController();

  void restPassword() {
    if (key.currentState!.validate()) {
      emit(RestPasswordLoading());
      Future.delayed(const Duration(seconds: 2), () {
        emit(RestPasswordSucsess());
      });
    }
  }
}
