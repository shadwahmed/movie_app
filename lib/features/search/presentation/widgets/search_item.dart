import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/search_response.dart';

class SearchItem extends StatelessWidget {
  static const String routeName = "routeName";
  List<Results> results;
  final int index;

  SearchItem({required this.results, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var finalPath = "$image${results[index].backdropPath}";
    return SafeArea(
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        finalPath,
                        height: 80,
                        fit: BoxFit.fill,
                        width: 140,
                      )),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: SingleChildScrollView(
                        child: Text(
                          "${results[index].title}",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${results[index].releaseDate}",
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.67)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${results[index].originalLanguage}",
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.67)),
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
      ),
    );
  }
}
