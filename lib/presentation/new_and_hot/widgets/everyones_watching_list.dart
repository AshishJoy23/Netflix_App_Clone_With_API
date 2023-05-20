import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class EveryOnesWatchingList extends StatelessWidget {
  const EveryOnesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneWatching());
      },
    );
    return RefreshIndicator(
      onRefresh: () async{
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneWatching());
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
          } else if (state.everyOneWatchingList.isEmpty) {
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
                  Text("Everyone's Watching List is Empty!!"),
                ],
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: state.everyOneWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyOneWatchingList[index];
                if (tv.id == null) {
                  return const SizedBox();
                }
                return EveryonesWatchingWidget(
                  backdropPath: "$imageAppendUrl${tv.backdropPath}",
                  movieName: tv.originalName??'No Title',
                  description: tv.overview??'No Description',
                );
              },
            );
          }
        },
      ),
    );
  }
}
