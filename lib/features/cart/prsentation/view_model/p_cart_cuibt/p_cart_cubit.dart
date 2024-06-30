import 'package:aman_store2/core/functions/display_snackbar.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/cheek_internet.dart';

import '../../../data/models/p_cart_model/p_cart_model.dart';
import '../../../data/repo/cart_repo.dart';

part 'p_cart_state.dart';

class PCartCubit extends Cubit<PCartState> {
  final CartRepo cartRepo;

  PCartCubit(this.cartRepo) : super(PCartInitial());

  void getCart(BuildContext context, {bool isFromProcess = false}) async {
    if (isFromProcess) {
      // displaySnackBar(context, message: 'updatingData'.tr(), isError: false);
      // emit(PCartMessage(message: ));
    } else {
      emit(PCartLoading());
    }

    if (await isConnection()) {
      var response = await cartRepo.getCartItems();
      response.fold((failure) {
        if (isFromProcess) {
          displaySnackBar(context, message: failure.errorMeasge);
        } else {
          emit(PCartFailure(message: failure.errorMeasge));
        }
      }, (carts) {
        if (carts.cartItems!.isEmpty) {
          emit(PCartFailure(message: 'noProducts'.tr()));
        } else {
          emit(PCartSucess(carts: carts));
        }
      });
    } else {
      emit(PCartFailure(message: noInterNet));
    }
  }

  void upDateQuantity(BuildContext context,
      {required int quantity, required int cartId}) async {
    displaySnackBar(context, message: 'loading'.tr());
    // emit(PCartMessage(message: 'loading'.tr()));

    if (await isConnection()) {
      var response =
          await cartRepo.updateQuantity(quantity: quantity, cartId: cartId);
      response.fold((failure) {
        displaySnackBar(context, message: failure.errorMeasge);
        // emit(PCartMessage(message: failure.errorMeasge));
      }, (sucess) {
        emit(PCartSucsess2());
      });
    } else {
      emit(PCartMessage(message: noInterNet));
    }
  }

  void deleteFromCart(BuildContext context, {required int cartId}) async {
    displaySnackBar(context, message: 'loading'.tr());

    if (await isConnection()) {
      var response = await cartRepo.deleteFromCart(cartId: cartId);
      response.fold((failure) {
        displaySnackBar(context, message: failure.errorMeasge);
      }, (sucess) {
        emit(PCartSucsess2());
      });
    } else {
      emit(PCartMessage(message: noInterNet));
    }
  }

  void addORdeleteFaviore(BuildContext context, {required int itemId}) async {
    displaySnackBar(context, message: 'loading'.tr());

    if (await isConnection()) {
      var response = await cartRepo.addORdeleteFaviore(itemId: itemId);
      response.fold((failure) {
        displaySnackBar(context, message: failure.errorMeasge);
      }, (sucess) {
        emit(PCartSucsess2());
      });
    } else {
      emit(PCartMessage(message: noInterNet));
    }
  }
}
