import 'package:bookly_app/core/errors/failures.dart';

import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

import 'package:dartz/dartz.dart';

import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellersBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
