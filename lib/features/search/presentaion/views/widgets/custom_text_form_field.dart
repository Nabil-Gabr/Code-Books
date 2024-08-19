import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
final  void Function(String) onChanged;
  final List<BookModel> books;
  const CustomTextFormField({
    super.key,
    required this.books, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged:onChanged,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: "Search",
          suffixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))),
    );
  }
}
