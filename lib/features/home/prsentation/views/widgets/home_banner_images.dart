import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/responsive_helper/screen_height.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/network_image.dart';
import '../../../data/models/banner_model.dart';

class HomeBannerImages extends StatelessWidget {
  final List<BannerModel> banners;

  const HomeBannerImages({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) / 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Swiper(
          outer: true,
          itemBuilder: (BuildContext context, int index) {
            return AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  // image: DecorationImage(
                  //     image: NetworkImage(banners[index].image.toString()),
                  //     fit: BoxFit.fill),
                ),
                child: NetWorkImageCached(
                  url: banners[index].image ?? '',
                ),
              ),
            );
          },
          scale: 2,
          itemCount: banners.length,
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  color: AppColors.kPrimColor.withOpacity(.5),
                  activeSize: 13,
                  activeColor: AppColors.kPrimColor)),
          autoplay: true,
        ),
      ),
    );
  }
}
