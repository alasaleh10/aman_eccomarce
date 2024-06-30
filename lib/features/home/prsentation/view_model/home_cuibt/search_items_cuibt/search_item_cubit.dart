import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/models/items_model.dart';
import '../../../../data/repos/home_repo.dart';

part 'search_item_state.dart';

class SearchItemCubit extends Cubit<SearchItemState> {
  final HomeRepo homeRepo;
  SearchItemCubit(this.homeRepo) : super(SearchItemInitial());
  final text = TextEditingController();

  void searchItem() async {
    emit(SearchItemILoading());

    if (await isConnection()) {
      var response = await homeRepo.searchItem(text: text.text);
      response.fold((failure) {
        emit(SearchItemFailure(message: failure.errorMeasge));
      }, (items) {
        emit(SearchItemSucsess(items: items));
      });
    } else {
      emit(SearchItemFailure(message: noInterNet));
    }
  }

  void clearData() {
    emit(SearchItemInitial());
  }
}
