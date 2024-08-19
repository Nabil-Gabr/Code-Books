import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());


  final HomeRepo homeRepo;
  Future<void> fatchNewsetBooks()async{
    emit(NewsetBooksLoading());

    var result=await homeRepo.fatchNewsetBooks();

    result.fold((failure) {
      emit(NewsetBookFailure(failure.errMessag));
      
    }, (books) {
      emit(NewsetBooksSuccess(books));
    },);


  }
}
