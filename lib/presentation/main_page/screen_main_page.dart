import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/colors.dart';
import 'package:netflix_app_clone/core/strings.dart';
import 'package:netflix_app_clone/infrastructure/api_key.dart';
import 'package:netflix_app_clone/presentation/downloads/screen_downloads.dart';
import 'package:netflix_app_clone/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix_app_clone/presentation/home/screen_home.dart';
import 'package:netflix_app_clone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_app_clone/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    const ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    //log("$kBaseUrl/trending/all/day?api_key=$apiKey");
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
