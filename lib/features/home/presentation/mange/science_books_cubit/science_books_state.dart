part of 'science_books_cubit.dart';

sealed class ScienceBooksState extends Equatable {
  const ScienceBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends ScienceBooksState {}
final class NewsetBooksLoading extends ScienceBooksState {}
final class NewsetBookFailure extends ScienceBooksState {
  final String errMessag;

 const NewsetBookFailure(this.errMessag);
}
final class NewsetBooksSuccess extends ScienceBooksState {
  final List<BookModel> books;

  const NewsetBooksSuccess(this.books);
}
