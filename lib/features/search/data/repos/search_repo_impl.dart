import 'package:bookly_app/features/search/data/repos/search_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_services.dart';
import '../../../home/data/models/book_model/book_model.dart';

class SearchRepoImp implements SearchRepo {
  final ApiServices apiService;

  SearchRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String query}) async {
    try {
      var data = await apiService.get(

          // search in title
          endPoint: 'volumes?Filtering=free-ebooks&q=Intitle:$query');

      List<BookModel> books = [];

      for (var item in data["items"]) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          print(e.toString());
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
