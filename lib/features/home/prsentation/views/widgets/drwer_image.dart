import 'package:flutter/material.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_assets.dart';

class DrwerImage extends StatelessWidget {
  const DrwerImage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Positioned(
        top: height * .15,
        right: isArabick(context) ? null : -width * .5,
        left: isArabick(context) ? -width * .6 : null,
        child: Transform.rotate(
          angle: isArabick(context) ? 0 : 3 / 11,
          child: Image.asset(
            Assets.imagesDrwerImage,
            height: height * .7,
          ),
        ));
  }
}

class DrwerContiner extends StatelessWidget {
  const DrwerContiner({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Positioned(
        top: height * .2,
        left: isArabick(context) ? -width * .5 : null,
        right: isArabick(context) ? null : -width * .5,
        child: Transform.rotate(
          angle: isArabick(context) ? -3 / 22 : 3 / 20,
          child: Container(
            height: height * .7 - 20,
            width: width * .8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.5)),
          ),
        ));
  }
}
