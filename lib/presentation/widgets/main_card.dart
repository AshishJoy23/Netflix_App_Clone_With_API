import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 110,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("https://www.themoviedb.org/t/p/w1280/p2G0aAb5lI4AycTC0UnBoY6zKs4.jpg"),
          ),
        ),
      ),
    );
  }
}