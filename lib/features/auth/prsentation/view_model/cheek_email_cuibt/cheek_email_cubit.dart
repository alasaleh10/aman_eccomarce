import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cheek_email_state.dart';

class CheekEmailCubit extends Cubit<CheekEmailState> {
  CheekEmailCubit() : super(CheekEmailInitial());
  final key = GlobalKey<FormState>();
  final email = TextEditingController();

  void cheekEmail() {
    if (key.currentState!.validate()) {
      emit(CheekEmailLoading());
      Future.delayed(const Duration(seconds: 2), () {
        emit(CheekEmailSucsess());
      });
    }
  }
}
