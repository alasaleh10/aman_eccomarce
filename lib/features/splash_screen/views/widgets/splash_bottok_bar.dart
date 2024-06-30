import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import 'splash_image_button.dart';

class SplashBottomImages extends StatelessWidget {
  const SplashBottomImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ImageBottom(
              height: MediaQuery.of(context).size.height * .4,
              image: Assets.imagesSplash1,
              right: -MediaQuery.of(context).size.height / 7,
              bottom: -20),
          const ImageBottom(image: Assets.imagesSplash2, bottom: -20, left: -10)
        ],
      ),
    );
  }
}
