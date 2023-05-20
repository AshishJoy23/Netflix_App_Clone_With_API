import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/colors.dart';
import 'package:netflix_app_clone/core/constants.dart';

class NumberCardWidget extends StatelessWidget {
  final int index;
  final String imageUrl;
  const NumberCardWidget({super.key, required this.index, required this.imageUrl,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            Container(
              width: 110,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 60,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 3.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                color: kBlackColor,
                fontSize: 108,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                //decorationColor: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
