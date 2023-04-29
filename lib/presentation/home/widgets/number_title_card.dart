import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_app_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final String title;
  const NumberTitleCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(
            title: title,
          ),
          kHeight,
          LimitedBox(
            maxHeight: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => NumberCardWidget(
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
