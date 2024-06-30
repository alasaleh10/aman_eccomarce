import 'package:aman_store2/core/functions/is_arabic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/cached_helper.dart';

part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialStates> {
  MaterialCubit() : super(MaterialInitial());

  void changeLange(BuildContext context) {
    if (isArabick(context)) {
      context.setLocale(const Locale('en'));
      CacheHelper.saveData(key: 'local', value: 'en');
      emit(MaterialInitial());
    } else {
      context.setLocale(const Locale('ar'));
      CacheHelper.saveData(key: 'local', value: 'ar');
      emit(MaterialInitial());
    }
    emit(MaterialInitial());
  }
}
