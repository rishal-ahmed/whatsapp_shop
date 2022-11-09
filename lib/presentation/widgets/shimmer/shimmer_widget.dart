import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.child,
    this.isLoading = true,
    this.shimmerChild,
    this.width,
    this.height,
    this.color = kWhite,
  });

  final Widget child;
  final Widget? shimmerChild;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: kColorShimmerBase,
            highlightColor: kColorShimmerHighlight,
            child: height != null
                ? Container(
                    color: color,
                    width: width ?? double.infinity,
                    height: height ?? double.infinity,
                  )
                : shimmerChild ?? child,
          )
        : child;
  }
}
