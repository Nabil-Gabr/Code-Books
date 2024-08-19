import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/function/launchUrl.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookActionSection extends StatelessWidget {
  const BookActionSection({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const CustomButton(
            backgroundColor: Colors.white,
            text: 'Free',
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
          ),
          CustomButton(
            onPressed: () {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink);
            },
            backgroundColor: Colors.amber,
            text: getText(bookModel),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12)),
          ),
        ],
      ),
    );
    
  }
  
  getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null){
      return 'Not Avaliable';
    }else{
      return 'preview';
    }
  }
}
