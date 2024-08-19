import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repository/seach_view_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit(this.seachViewRepo) : super( SearchCubitInitial());
  final SeachViewRepo seachViewRepo;
  List<BookModel> resultSearch = [];

  void search({required String search, required List<BookModel> books}) async {
    emit(SearchCubitLoading());
    if (search.isEmpty) {
      emit(SearchCubitEmpty());
    }else{
      var response =
        await seachViewRepo.searchForBooks( search: search, books: books);
    response.fold((failure) {
      emit(SearchCubitFailure(errMessage: failure));
    }, (searchReasult) {
      resultSearch = searchReasult;
      emit(SearchCubitSuccess(searchReaslut: searchReasult));
    });
    }
    
  }
}
