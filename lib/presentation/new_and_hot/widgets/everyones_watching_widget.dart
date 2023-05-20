import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/colors.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app_clone/presentation/widgets/video_widget.dart';
import 'package:share_plus/share_plus.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String backdropPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget({
    super.key,
    required this.backdropPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: kWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          description,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: kGreyColor, fontWeight: FontWeight.w600),
        ),
        kHeight50,
        VideoWidget(imageUrl: backdropPath),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async{
                await Share.share(movieName);
              },
              child: const CustomButtonWidget(
                icon: Icons.share,
                title: 'Share',
                iconSize: 26,
                textSize: 14,
                textWeight: FontWeight.bold,
                textColor: kGreyColor,
              ),
            ),
            kWidth,
            const CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 30,
              textSize: 14,
              textWeight: FontWeight.bold,
              textColor: kGreyColor,
            ),
            kWidth,
            const CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 30,
              textSize: 14,
              textWeight: FontWeight.bold,
              textColor: kGreyColor,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}
