import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/search_repo.dart';

class BooksSearchCubit extends Cubit<BooksSearchState> {
  BooksSearchCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String query}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchedBooks(query: query);
    result.fold(
      (fauilre) => {
        emit(SearchBooksFailure(fauilre.errMessage)),
      },
      (books) => {
        emit(SearchBooksSuccess(books)),
      },
    );
  }
}
