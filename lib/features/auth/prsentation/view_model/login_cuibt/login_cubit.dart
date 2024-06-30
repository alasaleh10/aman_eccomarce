import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/features/auth/data/model/login_model.dart';
import 'package:aman_store2/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/cached_helper.dart';
import '../../../../../core/helper/const_strings.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  final key = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  void cheekData() {
    if (key.currentState!.validate()) {
      login();
    }
  }

  void login() async {
   
    emit(LoginLoading());

    if (await isConnection()) {
      var response =
          await authRepo.login(email: email.text, password: password.text);
      response.fold((failure) {
        emit(LoginFailure(errorMessage: failure.errorMeasge));
      }, (loginModel) async {
        await CacheHelper.saveData(key: 'token', value: loginModel.token);
        emit(LoginSucsess(loginModel: loginModel));
      });
    } else {
      emit(LoginFailure(errorMessage: noInterNet));
    }
  }
}
