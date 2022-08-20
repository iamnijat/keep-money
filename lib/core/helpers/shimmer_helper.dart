import '../constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

mainGreyShimmer(BuildContext context, Widget child) {
  return Shimmer.fromColors(
      baseColor: AppPalette.fifthGrayColor,
      highlightColor: AppPalette.whiteColor,
      child: child);
}
