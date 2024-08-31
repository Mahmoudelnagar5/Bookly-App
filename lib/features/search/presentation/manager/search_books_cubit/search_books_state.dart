import 'package:equatable/equatable.dart';

import '../../../../home/data/models/book_model/book_model.dart';

sealed class BooksSearchState extends Equatable {
  const BooksSearchState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends BooksSearchState {}

final class SearchBooksLoading extends BooksSearchState {}

final class SearchBooksSuccess extends BooksSearchState {
  final List<BookModel> booksList;

  const SearchBooksSuccess(this.booksList);
}

final class SearchBooksFailure extends BooksSearchState {
  final String errMessage;

  const SearchBooksFailure(this.errMessage);
}
