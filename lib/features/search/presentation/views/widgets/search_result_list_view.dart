import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';
import '../../manager/search_books_cubit/search_books_state.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksSearchCubit, BooksSearchState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.booksList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  book: state.booksList[index],
                ),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return const Center(child: Text('There is no Books , Search again'));

          // return CustomErrorWidget(error: state.errMessage);
        } else {
          return Container();
        }
      },
    );
  }
}
