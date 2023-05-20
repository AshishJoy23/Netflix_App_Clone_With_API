import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
    );
    return RefreshIndicator(
      onRefresh: () async{
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
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
          } else if (state.comingSoonList.isEmpty) {
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
                  Text('Coming Soon List is Empty!!'),
                ],
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                final _date = DateTime.parse(movie.releaseDate!);
                final formatedDate = DateFormat.MMMd('en_US').format(_date);
                //log(formatedDate);
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formatedDate.split(' ').first.substring(0).toUpperCase(),
                  day: formatedDate.split(' ')[1],
                  backdropPath: "$imageAppendUrl${movie.backdropPath}",
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No Description',
                );
              },
            );
          }
        },
      ),
    );
  }
}