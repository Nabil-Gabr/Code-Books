import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/mange/science_books_cubit/science_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/chimmer_book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ComputerScienceListView extends StatelessWidget {
  const ComputerScienceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScienceBooksCubit,ScienceBooksState>(
      builder: (context, state) {
        if(state is NewsetBooksSuccess){
          return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ListView.builder(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return BookListViewItem(bookModel: state.books[index],);
          },
        ),
    );

        }else if(state is NewsetBookFailure){
          return CustomErrorWidget(errMessag: state.errMessag);
        }else{
          return Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey.withOpacity(.6),
              child: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ListView.builder(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ShimmerBookListViewItem() ;
          },
        ),
    ),
          );
        }
      },
    );
  }
}


