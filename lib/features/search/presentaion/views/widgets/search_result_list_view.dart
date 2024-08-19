import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/presentaion/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubitCubit, SearchCubitState>(
      builder: (context, state) {
        if (state is SearchCubitSuccess) {
          List<BookModel> searchReasult = state.searchReaslut;
          if (searchReasult.isEmpty) {
            return const Center(
                child: Text(
              "This Item Not Found ",
              style: Styles.textStyle_20,
            ));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: searchReasult.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: BookListViewItem(
                      bookModel: searchReasult[i],
                    ),
                  );
                });
          }
        } else if (state is SearchCubitFailure) {
          return CustomErrorWidget(errMessag: state.errMessage);
        } else if (state is SearchCubitLoading) {
          return const CustomLoadingIndicatorWidget();
        } else if (state is SearchCubitEmpty) {
          return const Center(
              child: Text(
            "Seacrh for item",
            style: Styles.textStyle_20,
          ));
        } else {
          return const Center(
              child: Text(
            "Seacrh for item",
            style: Styles.textStyle_20,
          ));
        }
      },
    );
  }
}
