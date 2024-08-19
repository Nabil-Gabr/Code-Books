import 'package:bookly_app/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
        aspectRatio: 2.6/4,
        child: CustomShimmer(),
      );
  }
}