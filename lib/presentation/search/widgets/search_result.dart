import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app_clone/application/search/search_bloc.dart';
import 'package:netflix_app_clone/core/constants.dart';
import 'package:netflix_app_clone/presentation/search/widgets/title.dart';

// const imageUrl = 'assets/downloads2.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              //log(state.searchResultList.toString());
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 7,
                childAspectRatio: 1 / 1.4,
                children: List.generate(
                  state.searchResultList.length,
                  (index) {
                    final movie = state.searchResultList[index];
                    //log('${state.searchResultList[index].originalTitle.toString()}>>>><<<');
                    return MainCard(currentMovie: movie);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  //final String imageUrl;
  final currentMovie;
  const MainCard({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    return (currentMovie.posterPath != null)
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(currentMovie.posterImageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'No Image Found!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          );
  }
}
