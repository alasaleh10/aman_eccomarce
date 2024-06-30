import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/helper/cached_helper.dart';
import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../view_model/add_location_cuibt/add_location_cubit.dart';
import 'get_my_location_continer.dart';

class GoogleMapStack extends StatelessWidget {
  const GoogleMapStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        BlocBuilder<AddLocationCubit, AddLocationState>(
          buildWhen: (previous, current) => current is AddLocationSucsess,
          builder: (context, state) {
            return GoogleMap(
                markers: BlocProvider.of<AddLocationCubit>(context).markers,
                onMapCreated: (controller) {
                  BlocProvider.of<AddLocationCubit>(context)
                      .googleMapController = controller;
                },
                zoomControlsEnabled: false,
                initialCameraPosition:
                    const CameraPosition(target: LatLng(0, 0)));
          },
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: GestureDetector(
              onTap: () {
                CacheHelper.saveData(key: 'location', value: '');

                GoRouter.of(context).goNamed(AppRouters.homeScreenView);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: AppColors.kPrimColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'skip'.tr(),
                  style: AppStyle.textStyleRegular16
                      .copyWith(color: AppColors.kPrimColor5),
                ),
              ),
            )),
        const Positioned(
            bottom: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: GetMyLocationContiner(),
            )),
      ],
    );
  }
}
