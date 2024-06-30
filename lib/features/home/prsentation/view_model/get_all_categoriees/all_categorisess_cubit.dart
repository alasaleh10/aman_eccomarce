import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:aman_store2/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/categoriee_model.dart';

part 'all_categorisess_state.dart';

class AllCategorisessCubit extends Cubit<AllCategorisessState> {
  final HomeRepo homeRepo;
  AllCategorisessCubit(this.homeRepo) : super(AllCategorisessInitial());
  void getAllCategorisee() async {
    emit(AllCategorisessLoading());
    if (await isConnection()) {
      var response = await homeRepo.getAllCategorisee();
      response.fold((failure) {
        emit(AllCategorisessFailure(message: failure.errorMeasge));
      }, (categorisess) {
        emit(AllCategorisessSucsess(categorisess: categorisess));
      });
    } else {
      emit(AllCategorisessFailure(message: noInterNet));
    }
  }
}
