import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.borderRadius, 
    this.onPressed,
  });

  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius?? BorderRadius.circular(12)),
              backgroundColor: backgroundColor,
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: Styles.textStyle_18.copyWith(
                color: textColor,
                fontWeight: FontWeight.w900,
              ),
            )),
      ),
    );
  }
}

