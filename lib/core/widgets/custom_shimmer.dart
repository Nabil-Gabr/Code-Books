import 'package:flutter/material.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key, this.width, this.height});
  final double? width , height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width ,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.4),
        borderRadius:const BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }
}