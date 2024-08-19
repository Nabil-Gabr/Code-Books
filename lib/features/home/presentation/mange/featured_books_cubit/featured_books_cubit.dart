import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  List<BookModel> searchbooks = [];

  //3-create Function
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
    var result=await homeRepo.fatchFeaturedBooks();

    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessag));
    }, (books) {
      searchbooks = [];
      searchbooks.addAll(books);
      emit(FeaturedBooksSuccess(books));
    },);
  }//
}
