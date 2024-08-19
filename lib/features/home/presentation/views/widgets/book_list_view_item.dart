import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key, required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.KBookDetailsView,extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              CustomBookItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
              const SizedBox(width: 20,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bookModel.volumeInfo.title!,style: Styles.textStyle_20,maxLines: 2,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 5,),
                  Text(bookModel.volumeInfo.authors![0],style: Styles.textStyle_16,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 5,),
                  const Row(children: [Text('frre book',style: TextStyle(color: Colors.grey),),Spacer(),BooksRating()],),
                  
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}




