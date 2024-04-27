import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/search_response.dart';

class SearchItem extends StatelessWidget {

  static const String routeName = "routeName";
  List<Results> results;
  final int index;

   SearchItem({required this.results,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var finalPath = "$image${results[index].backdropPath}";
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(finalPath)),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${results[index].title}",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${results[index].releaseDate}",
                    style: TextStyle(
                        fontSize: 10, color: Colors.white.withOpacity(0.67)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${results[index].originalLanguage}",
                    style: TextStyle(
                        fontSize: 10, color: Colors.white.withOpacity(0.67)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Divider(
            thickness: 1,
            color: Colors.white.withOpacity(0.67),
            indent: 20,
            endIndent: 20,
          )
        ],
      ),
    );
  }
}
