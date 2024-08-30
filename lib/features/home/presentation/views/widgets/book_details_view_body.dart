import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.2,
            ),
            child: const CustomBookImage(),
          ),
          const SizedBox(height: 35),
          Align(
            alignment: Alignment.center,
            child: Text(
              'The Alchemist',
              style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Opacity(
            opacity: 0.7,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                ' Paulo Coelho',
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 30),
          const BooksAction(),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SimilarBooksListView(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
