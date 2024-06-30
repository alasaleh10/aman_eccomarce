

import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:aman_store2/features/saved_address/data/repo/address_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/address_model.dart';

part 'my_address_state.dart';

class MyAddressCubit extends Cubit<MyAddressState> {
  final AddressRepo addressRepo;
  MyAddressCubit(this.addressRepo) : super(MyAddressInitial());
List<AddressModel> address=[];
  void getAddress()async
  {
    emit( MyAddressLoading());
    if (await isConnection()) {
      var response=await addressRepo.getAddress();
      response.fold((failure) 
      {
        emit(MyAddressFailure(message: failure.errorMeasge));
      }, (newaddress) 
      {
        address.clear();
        address=newaddress;
        emit(MyAddressSucess(address: address));
      }
      );
      
    } else {
      emit(MyAddressFailure(message: noInterNet));
      
    }
  }
}
