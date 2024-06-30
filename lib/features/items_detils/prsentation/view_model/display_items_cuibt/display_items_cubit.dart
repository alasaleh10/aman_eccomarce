import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:aman_store2/features/items_detils/data/item_detils_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/items_model.dart';

part 'display_items_state.dart';

class DisplayItemsCubit extends Cubit<DisplayItemsState> {
  final ItemDetilsRepo itemDetilsRepo;
  DisplayItemsCubit(this.itemDetilsRepo) : super(DisplayItemsInitial());

  void getCategorieeItems({required int catId}) async {
    emit(DisplayItemsLoading());
    if (await isConnection()) {
      var response = await itemDetilsRepo.getCategorieeItems(catId: catId);
      response.fold((failure) {
        emit(DisplayItemsFailure(message: failure.errorMeasge));
      }, (items) {
        emit(DisplayItemsSucsess(items: items));
      });
    } else {
      emit(DisplayItemsFailure(message: noInterNet));
    }
  }
}
