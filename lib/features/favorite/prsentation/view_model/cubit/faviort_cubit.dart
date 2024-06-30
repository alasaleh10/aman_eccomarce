import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:aman_store2/features/favorite/data/repo/faviort_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/faviort_model/faviort_model.dart';

part 'faviort_state.dart';

class FaviortCubit extends Cubit<FaviortState> {
  final FaviorteRepo faviorteRepo;
  FaviortCubit(this.faviorteRepo) : super(FaviortInitial());

  void getFaviort({bool isFromadding = false}) async {
    if (isFromadding) {
      emit(FaviortMessage(message: 'updatingData'.tr()));
    } else {
      emit(FaviortLoading());
    }

    if (await isConnection()) {
      var result = await faviorteRepo.getFaviort();
      result.fold((failure) {
        emit(FaviortFailure(message: failure.errorMeasge));
      }, (items) {
        emit(FaviortSucess(items: items));
      });
    } else {
      if (isFromadding) {
        emit(FaviortMessage(message: noInterNet));
      } else {
        emit(FaviortFailure(message: noInterNet));
      }
    }
  }

  void deleteFaviort({required int itemId}) async {
    emit(FaviortMessage(message: 'loading'.tr()));
    if (await isConnection()) {
      var result = await faviorteRepo.deleteFaviort(itemId: itemId);
      result.fold((failure) {
        emit(FaviortMessage(message: failure.errorMeasge));
      }, (sucess) {
        emit(FaviortSucsess2());
      });
    } else {
      emit(FaviortMessage(message: noInterNet));
    }
  }
}
