import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/shimmer_card.dart';
import 'package:bookly_app/features/home/presentation/mange/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccess){
          return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomBookItem(
                  imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              );
            },
          ),
        );
        }else if(state is SimilarBooksFailure){
          return CustomErrorWidget(errMessag: state.errMessag);
        }else{
          return Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey.withOpacity(.6),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .15,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ShimmerCard(),
                    );
                  },
                ),
              ),
              );
        }
      },
    );
  }
}
