import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:aman_store2/features/auth/data/model/login_model.dart';
import 'package:aman_store2/features/my_account/data/account_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountRepo accountRepo;
  AccountCubit(this.accountRepo) : super(AccountInitial());

  void getProfile() async {
    emit(AccountInLoading());

    if (await isConnection()) {
      var response = await accountRepo.getUserProfile();
      response.fold((failure) {
        emit(AccountFailure(message: failure.errorMeasge));
      }, (userData) {
        emit(AccountSucess(userData: userData));
      });
    } else {
      emit(AccountFailure(message: noInterNet));
    }
  }
}
