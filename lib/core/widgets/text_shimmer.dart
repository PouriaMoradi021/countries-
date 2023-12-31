import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TextShimmer extends StatelessWidget {
  final double width, height;

  const TextShimmer({super.key, this.width=100, this.height=10});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade500,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }
}
