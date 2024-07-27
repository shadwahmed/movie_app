import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/features/browse/presentation/widgets/more_modelForCategory.dart';
import 'package:movie_app/features/browse/presentation/widgets/movie_details_screenForCategory.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/pouplrModelTry.dart';
import 'package:movie_app/features/watchlist/data/datasources/firebase/firebase_services.dart';
import '../../../homeTab/data/models/popular_response.dart';

class WatchListItem extends StatefulWidget {
  PouplrModelTry MovieItem;

  // List<Results>? results;
  // int index;
  WatchListItem({required this.MovieItem, super.key});

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var finalPath =
        "$image${widget.MovieItem.results![widget.MovieItem.index!].backdropPath}";
    bool isFavorite = true;
    return SafeArea(
      child: InkWell(
        // onTap: (){
        //   Navigator.pushNamed(context, MovieDetailsScreenForCategory.routName,
        //       arguments: MoreModelForSearch(index: index, results: results ,));},
        child: Column(
          children: [
            Row(
              children: [
                Stack(children: [
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        FirebaseServices.deleteMovie("${widget.MovieItem.id}");
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        "assets/images/watchlist_icon.png",
                      ),
                    ),
                  ),
                ]),
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
                          "${widget.MovieItem.results![widget.MovieItem.index!].title}",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${widget.MovieItem.results![widget.MovieItem.index!].releaseDate}",
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.67)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${widget.MovieItem.results![widget.MovieItem.index!].originalLanguage}",
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.67)),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 2,
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
