import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/colors/colors.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/downloads_image_widget.dart';

class SectionTwo extends StatelessWidget {
  SectionTwo({super.key});

  final List imageList = [
    'https://www.themoviedb.org/t/p/w1280/lM8fcQuowyvmoGHTrnSZbnc9a2J.jpg',
    'https://www.themoviedb.org/t/p/w1280/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
    'https://www.themoviedb.org/t/p/w1280/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: size.width,
          width: size.width,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.4),
                radius: size.width * 0.36,
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 150, bottom: 30),
                angle: 20,
                size: Size(size.width * 0.34, size.width * 0.51),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 150, bottom: 30),
                angle: -20,
                size: Size(size.width * 0.34, size.width * 0.51),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(top: 10),
                size: Size(size.width * 0.38, size.width * 0.58),
              ),
            ],
          ),
        ),
      ],
    );
  }
}