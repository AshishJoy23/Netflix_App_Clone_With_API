import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app_clone/core/colors/colors.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_app_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              //print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackgroundCard(),
                    MainTitleCard(title: 'Released in the past year'),
                    kHeight20,
                    MainTitleCard(title: 'Trending Now'),
                    kHeight20,
                    NumberTitleCard(title: "Top 10 TV Shows in India Today"),
                    kHeight20,
                    MainTitleCard(title: 'Tense  Dramas'),
                    kHeight20,
                    MainTitleCard(title: 'South Indian Cinema'),
                  ],
                ),
                scrollNotifier.value
                    ? AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 1000,
                        ),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                                  height: 60,
                                  width: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                                kWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: kHomeAppbarText,
                                ),
                                Text('Movies', style: kHomeAppbarText),
                                Row(
                                  children: [
                                    Text(
                                      'Categories',
                                      style: kHomeAppbarText,
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: kButtonColorWhite,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
