import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksRating extends StatelessWidget {
  const BooksRating({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.solidStar,size: 14,color: Colors.amber,),
        SizedBox(width: 6.3,),
        Text("4.6",style: Styles.textStyle_16,),
        SizedBox(width: 5,),
        Opacity(
          opacity: .5,
          child: Text("(245)")),
      ],
    );
  }
}