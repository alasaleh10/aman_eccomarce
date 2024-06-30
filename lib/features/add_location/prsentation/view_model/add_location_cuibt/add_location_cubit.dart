import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/helper/cached_helper.dart';
import '../../../../../core/helper/location_helper.dart';

part 'add_location_state.dart';

class AddLocationCubit extends Cubit<AddLocationState> {
  AddLocationCubit() : super(AddLocationInitial());
  GoogleMapController? googleMapController;
  LocationService servess = LocationService();
  String? myCurrentLocation;
  Set<Marker> markers = {};
  getCurrentLocation() async {
    var location = await servess.getLocation();

    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude!, location.longitude!);
    googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(location.latitude!, location.longitude!),
            zoom: 19)));
    myCurrentLocation = placemarks[0].locality;

    CacheHelper.saveData(key: 'location', value: myCurrentLocation ?? '');

    markers = {
      Marker(
          markerId: const MarkerId('1'),
          position: LatLng(location.latitude!, location.longitude!))
    };
    emit(AddLocationSucsess());
  }

  void goToMyLocation() async {
    emit(AddLocationLoading());
    var location = await servess.getLocation();
    googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(location.latitude!, location.longitude!),
            zoom: 19)));
    markers.clear();
    markers = {
      Marker(
          markerId: const MarkerId('1'),
          position: LatLng(location.latitude!, location.longitude!))
    };

    emit(AddLocationSucsess());
  }

  void confirmLocation() {
    emit(AddLocationLoading2());
    Future.delayed(const Duration(seconds: 2), () {
      emit(AddLocationSucsess2());
    });
  }

  @override
  Future<void> close() {
    googleMapController?.dispose();
    return super.close();
  }
}
