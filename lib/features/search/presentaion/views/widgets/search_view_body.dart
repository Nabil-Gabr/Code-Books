import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentaion/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_text_form_field.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatefulWidget {
  final List<BookModel> books;
  const SearchViewBody({super.key, required this.books});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: const Icon(Icons.arrow_back)),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            books: widget.books,
            onChanged: (value) {
              BlocProvider.of<SearchCubitCubit>(context)
                  .search(search: value, books: widget.books);
              if (value.isEmpty) {
                setState(() {
                  BlocProvider.of<SearchCubitCubit>(context).resultSearch = [];
                });
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text("Search Result", style: Styles.textStyle_18),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}
