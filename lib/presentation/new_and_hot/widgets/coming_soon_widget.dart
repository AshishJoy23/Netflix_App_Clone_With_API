import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/colors.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
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
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              kHeight20,
              Row(
                children: [
                  const Text(
                    'TALL GIRL2',
                    style: TextStyle(
                      fontSize: 34,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
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
                      CustomButtonWidget(
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
                ],
              ),
              kHeight,
              Text(
                'Coming on Friday',
                style: TextStyle(
                  color: kWhiteColor.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              const Text(
                'Tall Girl 2',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              const Text(
                "Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence --- and her relationship --- into a tailspin.",
                style:
                    TextStyle(color: kGreyColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
