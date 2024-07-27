import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/for_recomendedPart/moreLikeThis_Item_forRecomended.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/for_recomendedPart/more_model_forRecomended.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/for_recomendedPart/movie_details_screen_forRecomended.dart';

import '../../data/models/recomended_response.dart';

class RecomendedItem extends StatefulWidget {
  List<Results> results;
  final int index;

  RecomendedItem({required this.results, required this.index, super.key});

  @override
  State<RecomendedItem> createState() => _RecomendedItemState();
}

class _RecomendedItemState extends State<RecomendedItem> {
  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var finalPath = "$image${widget.results[widget.index].posterPath}";

    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, MovieDetailsScreenForRecomended.routName,
                    arguments: MoreModelForRecomended( results: widget.results, index:widget.index));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  height: 120,
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
        ),
        Container(
          padding: EdgeInsets.only(left: 8),
          height: 36,
          width: 77,
          color: Color(0xff343534),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 14,
                    color: Color(0xffFFBB3B),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${widget.results[widget.index].voteAverage}",
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                ],
              ),
              Text("${widget.results[widget.index].title}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 9, color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}
