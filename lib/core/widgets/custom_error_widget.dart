import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessag});

  final String errMessag;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessag,
        style: Styles.textStyle_18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
