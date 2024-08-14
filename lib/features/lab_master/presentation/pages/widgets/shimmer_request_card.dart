import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRequestCard extends StatelessWidget {
  const ShimmerRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
