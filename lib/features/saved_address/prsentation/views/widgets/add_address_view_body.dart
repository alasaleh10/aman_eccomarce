import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressViewBody extends StatelessWidget {
  const AddAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * .6,
            child: GoogleMap(
                onTap: (argument) {
                
                },
                initialCameraPosition: const CameraPosition(
                    target: LatLng(15.939803843560757, 48.80171089703517),
                    zoom: 18)))
      ],
    );
  }
}
