import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newset_books_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomAppBar(),
          ),
        ),
        SliverToBoxAdapter(
          child: FeaturedBooksListView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 35),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Newest Books',
              style: Styles.textStyle18,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 5),
        ),
        // The Book List View
        BooksListView(),
      ],
    );
  }
}
