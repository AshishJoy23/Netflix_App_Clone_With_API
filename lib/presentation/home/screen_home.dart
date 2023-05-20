import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app_clone/application/home/home_bloc.dart';
import 'package:netflix_app_clone/core/colors.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_app_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
      },
    );
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
        },
        child: ValueListenableBuilder(
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
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      } else if (state.isError) {
                        return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error,
                      size: 100,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Error while getting data!!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
                      } else if (state.trendingTvList.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.image_not_supported,
                                size: 100,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Data Not Availiable!!'),
                            ],
                          ),
                        );
                      }

                      // releases past year
                      final _pastYear = state.pastYearMovieList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList().sublist(0,10);

                      // trending list
                      final _trending = state.trendingMovieList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList().sublist(0,10);
                      _trending.shuffle();

                      // tense dramas list
                      final _tenseDramas = state.tenseDramaMovieList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList().sublist(0,10);
                      //_tenseDramas.shuffle();

                      // south Indian movie list
                      final _southIndian = state.southIndianMovieList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList().sublist(0,10);
                      _southIndian.shuffle();

                      //south top10 list
                      final _top10List = state.trendingTvList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList().sublist(0,10);

                      return ListView(
                        children: [
                          BackgroundCard(
                            imageUrl: (_southIndian.isEmpty)
                                ? ""
                                : _southIndian.first,
                          ),
                          MainTitleCard(
                            title: 'Released in the past year',
                            posterPathList: _pastYear,
                          ),
                          kHeight20,
                          MainTitleCard(
                            title: 'Trending Now',
                            posterPathList: _trending,
                          ),
                          kHeight20,
                          NumberTitleCard(
                            title: "Top 10 TV Shows in India Today",
                            posterPathList: _top10List,
                          ),
                          kHeight20,
                          MainTitleCard(
                            title: 'Tense  Dramas',
                            posterPathList: _tenseDramas,
                          ),
                          kHeight20,
                          MainTitleCard(
                            title: 'South Indian Cinema',
                            posterPathList: _southIndian,
                          ),
                        ],
                      );
                    },
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
                                  Image.asset(
                                    "assets/netflix_logo.png",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}
