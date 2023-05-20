import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/colors.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String backdropPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.backdropPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                  color: kGreyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 28,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 80,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(imageUrl: backdropPath),
              kHeight20,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const CustomButtonWidget(
                    icon: Icons.notifications_outlined,
                    title: 'Remind Me',
                    iconSize: 20,
                    textSize: 10,
                    textWeight: FontWeight.bold,
                    textLetterSpacing: 0,
                    textColor: kGreyColor,
                  ),
                  kWidth,
                  kWidth,
                  const CustomButtonWidget(
                    icon: Icons.info_outlined,
                    title: 'Info',
                    iconSize: 20,
                    textSize: 10,
                    textWeight: FontWeight.bold,
                    textColor: kGreyColor,
                  ),
                  kWidth,
                ],
              ),
              kHeight,
              Text(
                'Coming on $day $month',
                style: TextStyle(
                  color: kWhiteColor.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                movieName,
                style: const TextStyle(
                  color: kWhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                description,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: kGreyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
