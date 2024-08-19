import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({super.key, required this.fontSize});
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
          "CodeBooks",
          style: GoogleFonts.rowdies(
            textStyle:  TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold)
          ),
          textAlign: TextAlign.center,
        );
  }
}