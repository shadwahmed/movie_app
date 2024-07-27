import 'package:flutter/material.dart';
import 'package:movie_app/features/homeTab/data/models/releases_response.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/for_releasesPart/moreLikeThis_Item_forReleases.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/for_releasesPart/more_model_forRelease.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/for_releasesPart/movie_details_screen_forReleases.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/moreLikeThis_Item.dart';

import 'movie_details_screen.dart';

class ReleaseItem extends StatefulWidget {
  List<Results> results;
  final int index;

  ReleaseItem({required this.results, required this.index, super.key});

  @override
  State<ReleaseItem> createState() => _ReleaseItemState();
}

class _ReleaseItemState extends State<ReleaseItem> {
  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var finalPath = "$image${widget.results[widget.index].posterPath}";
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, MovieDetailsScreenForReleases.routName,
                arguments: MoreModelForReleases(
                    results: widget.results, index: widget.index));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              height: 150,
              finalPath,
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Image.asset(
            "assets/images/bookmark.png",
          ),
        ),
      ],
    );
  }
}
