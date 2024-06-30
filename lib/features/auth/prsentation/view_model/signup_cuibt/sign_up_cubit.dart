import 'package:aman_store2/features/auth/data/model/sign_up_model.dart';
import 'package:aman_store2/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/cheek_internet.dart';
import '../../../../../core/helper/cached_helper.dart';
import '../../../../../core/helper/const_strings.dart';
import '../../../data/model/sign_up_class.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final key = GlobalKey<FormState>();

  final name2 = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password1 = TextEditingController();
  final password2 = TextEditingController();

  void cheekData() {
    if (key.currentState!.validate()) {
      signUp();
    }
  }

  void signUp() async {
    emit(SignUpLoading());
    SignUpClass userData = SignUpClass(
        name: name2.text,
        email: email.text,
        phone: phone.text,
        password: password1.text);
    emit(SignUpLoading());
    if (await isConnection()) {
      var response = await authRepo.signUp(userData: userData);
      response.fold((failure) {
        emit(SignUpFailure(errorMessage: failure.errorMeasge));
      }, (signUpModel) async {
        await CacheHelper.saveData(key: 'token', value: signUpModel.token);
        emit(SignUpSucsess(signUpModel: signUpModel));
      });
    } else {
      emit(SignUpFailure(errorMessage: noInterNet));
    }
  }
}
