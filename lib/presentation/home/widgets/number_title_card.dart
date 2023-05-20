import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_app_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final String title;
  final List<String> posterPathList;
  const NumberTitleCard({
    super.key,
    required this.title,
    required this.posterPathList,
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
                posterPathList.length,
                (index) => NumberCardWidget(
                  index: index,
                  imageUrl: posterPathList[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
