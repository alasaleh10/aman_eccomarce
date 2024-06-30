import 'package:aman_store2/core/functions/cheek_internet.dart';
import 'package:aman_store2/core/helper/const_strings.dart';
import 'package:aman_store2/features/home/data/repos/home_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/categoriee_model.dart';
import '../../../../../core/models/items_model.dart';
import '../../../data/models/banner_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  List<BannerModel> bannerList = [];
  List<ItemsModel> itemsList = [];
  List<ItemsModel> monthStock = [];
  List<CategorieeModel> categorisess = [];

  void getHomeData({bool isFromProcess = false}) async {
    if (isFromProcess) {
      emit(HomeFailure2(message: 'updatingData'.tr()));
    } else {
      emit(HomeLoading());
    }

    if (await isConnection()) {
      var response = await homeRepo.getHomeData();
      response.fold((failure) {
        if (isFromProcess) {
          emit(HomeFailure2(message: failure.errorMeasge));
        } else {
          emit(HomeFailure(message: failure.errorMeasge));
        }
      }, (sucsess) {
        bannerList.clear();
        itemsList.clear();
        monthStock.clear();
        categorisess.clear();
        bannerList = sucsess[0];
        itemsList = sucsess[1];
        monthStock = sucsess[2];
        categorisess = sucsess[3];
        emit(HomeSucsess(
            banners: bannerList,
            items: itemsList,
            monthStock: monthStock,
            categorisess: categorisess));
      });
    } else {
      if (isFromProcess) {
        emit(HomeFailure2(message: noInterNet));
      } else {
        emit(HomeFailure(message: noInterNet));
      }
    }
  }
}
