import 'package:aman_store2/features/material_aman/cubit/material_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helper/cached_helper.dart';
import 'core/helper/location_helper.dart';

import 'core/widgets/simple_observer_bolc.dart';

import 'features/material_aman/app_material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.onInitCacheHelper();
  await LocationService().cheekLocationPermision();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleObserver();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(EasyLocalization(
      startLocale: const Locale('ar'),
      path: 'assets/translations',
      supportedLocales: const [Locale('ar'), Locale('en')],
      child: BlocProvider(
          create: (context) => MaterialCubit(), child: const AmanStore())
      //  DevicePreview(
      //   builder: (context) => const AmanStore(),
      // ),
      ));
}
