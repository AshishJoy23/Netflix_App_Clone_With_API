import 'package:flutter/material.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/section_three.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/section_two.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/smart_downloads.dart';
import 'package:netflix_app_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final widgetList = [
    const SmartDownloads(),
    SectionTwo(),
    const SectionThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (ctx, index) => widgetList[index],
          separatorBuilder: (ctx, index) => const SizedBox(
                height: 20,
              ),
          itemCount: widgetList.length),
    );
  }
}
