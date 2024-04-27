import 'package:flutter/material.dart';
import 'package:movie_app/features/homeTab/data/models/releases_response.dart';

class ReleaseItem extends StatelessWidget {
  List<Results> results;
  final int index;

  ReleaseItem({required this.results, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var finalPath = "$image${results[index].posterPath}";

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            height: 150,
            finalPath,
          ),
        ),
        Image.asset(
          "assets/images/bookmark.png",
        ),
      ],
    );
  }
}
