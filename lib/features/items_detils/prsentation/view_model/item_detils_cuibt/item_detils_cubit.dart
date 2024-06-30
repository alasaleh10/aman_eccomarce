import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:aman_store2/core/models/items_model.dart';
import 'package:aman_store2/features/items_detils/data/item_detils_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_detils_state.dart';

class ItemDetilsCubit extends Cubit<ItemDetilsState> {
  final ItemDetilsRepo itemDetilsRepo;
  ItemDetilsCubit(this.itemDetilsRepo) : super(ItemDetilsInitial());

  void getItemDetils({required int itemId,bool isFromProcess=false}) async {

    if (isFromProcess) {
      emit(ItemDetilsFailure2(message: 'updatingData'.tr()));
      
    } else {
          emit(ItemDetilsLoading());
      
    }

    if (await isConnection()) {
      var response = await itemDetilsRepo.getItemDetils(itemId: itemId);
      response.fold((failure) {
        if (isFromProcess) {
          emit(ItemDetilsFailure2(message: failure.errorMeasge));

          
        } else {
          emit(ItemDetilsFailure(message: failure.errorMeasge));
          
        }
        
      }, (itemsModel) {
        emit(ItemDetilsSucsess(itemsModel: itemsModel));
      });
    } else {
      if (isFromProcess) {
        emit(ItemDetilsFailure2(message: noInterNet));
        
      } else {
        emit(ItemDetilsFailure(message: noInterNet));
        
      }
      
    }
  }

  void addORdeleteCart({required itemId}) async {
    emit(ItemDetilsFailure2(message: 'loading'.tr()));
    if (await isConnection()) {
      var response=await itemDetilsRepo.addORdeleteCart(itemId: itemId);
      response.fold((failure) 
      {
        emit(ItemDetilsFailure2(message: failure.errorMeasge));
      }, (r) 
      {
        emit(ItemDetilsSucsess2());
      }
      );
      
    } else {
      emit(ItemDetilsFailure2(message: noInterNet));
      
    }
  }
}
