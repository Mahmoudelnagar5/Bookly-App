import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';

import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

import 'package:dartz/dartz.dart';

import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      Map<String, dynamic> jsonData = await apiServices.get(
        endPoint:
            'volumes?q=subject:Programming&Sorting=newest&filtering=free-ebooks',
      );

      List<BookModel> books = [];
      for (var item in jsonData['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
