import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SeachViewRepo {
  Future<Either<String,List<BookModel>>> searchForBooks(
      {required String search,required List<BookModel> books});
}
