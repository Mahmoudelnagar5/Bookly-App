// import 'package:bookly_app/core/widgets/custom_loding_indicator.dart';
// import 'package:bookly_app/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
// import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/widgets/custom_error_widget.dart';

// class BooksListView extends StatelessWidget {
//   const BooksListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
//       builder: (context, state) {
//         if (state is NewsetBooksSuccess) {
//           return SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 30,
//                   ),
//                   child: BookListViewItem(
//                     book: state.books[index],
//                   ),
//                 );
//               },
//               childCount: state.books.length,
//             ),
//           );
//         } else if (state is NewsetBooksFailure) {
//           return SliverToBoxAdapter(
//             child: CustomErrorWidget(
//               error: state.errMessage,
//             ),
//           );
//         } else {
//           return const SliverToBoxAdapter(
//             child: CustomLodingIndicator(),
//           );
//         }
//       },
//     );
//   }
// }

import 'package:bookly_app/core/widgets/custom_loding_indicator.dart';
import 'package:bookly_app/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: BookListViewItem(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewsetBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              error: state.errMessage,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: CustomLodingIndicator(),
          );
        }
      },
    );
  }
}
