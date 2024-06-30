import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageBottom extends StatelessWidget {
  final String image;
  final double? right;
  final double? bottom;
  final double? left;
  final double? height;

  const ImageBottom(
      {super.key,
      required this.image,
      this.right,
      this.bottom,
      this.left,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      left: left,
      //  -MediaQuery.of(context).size.height / 7,
      bottom: bottom,
      child: SvgPicture.asset(
        image,
        height: height,
      ),
    );
  }
}
