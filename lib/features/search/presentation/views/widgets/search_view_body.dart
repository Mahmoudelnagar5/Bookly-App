import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/search_books_cubit/search_books_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onChanged: (data) {
              if (data.isNotEmpty) {
                BlocProvider.of<BooksSearchCubit>(context)
                    .fetchSearchedBooks(query: data);
              }
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Search Result',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
