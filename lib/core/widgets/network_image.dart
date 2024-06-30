import 'package:aman_store2/core/utils/app_assets.dart';
import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetWorkImageCached extends StatelessWidget {
  final String url;
  const NetWorkImageCached({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const CustomLoading(),
      errorWidget: (context, url, error) =>
          Image.asset(Assets.imagesErroeImage),
    );
  }
}
