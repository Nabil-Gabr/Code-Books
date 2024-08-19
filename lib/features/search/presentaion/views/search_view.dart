import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/presentaion/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final List<BookModel> books;
  const SearchView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      body: SearchViewBody(
        books: books,
      ),
    ));
  }
}
