import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/popular_response.dart';

class MoreLikeThisItem extends StatelessWidget {

  List<Results> results;
  final int index;

  MoreLikeThisItem({required this.results, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var finalPath = "$image${results[index].posterPath}";

    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                height: 120,
                finalPath,
              ),
            ),
            Image.asset(
              "assets/images/bookmark.png",
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
                    "${results[index].voteAverage}",
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                ],
              ),
              Text("${results[index].title}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 9, color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}
