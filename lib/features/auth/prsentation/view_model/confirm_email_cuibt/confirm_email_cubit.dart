import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'confirm_email_state.dart';

class ConfirmEmailCubit extends Cubit<ConfirmEmailState> {
  ConfirmEmailCubit() : super(ConfirmEmailInitial());
  int secondsRemaining = 60;
  Timer timer = Timer(const Duration(seconds: 60), () {});
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  final t3 = TextEditingController();

  final t4 = TextEditingController();
  String? otpCode;

  void startTimer() {
    t1.clear();
    t2.clear();
    t3.clear();
    t4.clear();

    timer.cancel();
    secondsRemaining = 60;

    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (secondsRemaining == 0) {
        timer.cancel();
      } else {
        secondsRemaining--;
        emit(ConfirmEmailInitial());
      }
    });
    emit(ConfirmEmailInitial());
  }

  void confirmEmail() {
    if (t1.text.isEmpty ||
        t2.text.isEmpty ||
        t3.text.isEmpty ||
        t4.text.isEmpty) {
      emit(ConfirmEmailFailure(errorMessage: 'completCode'.tr()));
    } else {
      otpCode = t1.text + t2.text + t3.text + t4.text;

      emit(ConfirmEmailLoading());
      Future.delayed(const Duration(seconds: 2), () {
        emit(ConfirmEmailSucsess());
      });
    }
  }
}
