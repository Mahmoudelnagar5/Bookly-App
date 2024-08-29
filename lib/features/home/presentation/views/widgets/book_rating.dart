import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 20,
        ),
        const SizedBox(width: 6.3),
        const Text(
          '4.9',
          style: Styles.textStyle18,
        ),
        const SizedBox(width: 5),
        Text(
          '(1200)',
          style: Styles.textStyle14.copyWith(
            color: const Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
