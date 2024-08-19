import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
            padding:  EdgeInsets.symmetric(horizontal: width * .28),
            child: CustomBookItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',),
          ),
          const SizedBox(height: 20,),
           Text(bookModel.volumeInfo.title!,style: Styles.textStyle_20,textAlign: TextAlign.center,),
          
           Opacity(opacity: .7,
           child: Text(bookModel.volumeInfo.authors?[0] ?? '',style: Styles.textStyle_18.copyWith(fontStyle: FontStyle.italic,fontWeight: FontWeight.w500),)),
          
          const BooksRating(),
      ],
    );
  }
}