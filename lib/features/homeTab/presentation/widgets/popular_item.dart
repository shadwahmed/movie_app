import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/moreLikeThis_Item.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/more_model.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/movie_details_screen.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/pouplrModelTry.dart';
import 'package:movie_app/features/watchlist/data/datasources/firebase/firebase_services.dart';

import '../../data/models/popular_response.dart';

class PopularItem extends StatefulWidget {
  List<Results> results;
  final int index;

  PopularItem({required this.results,required this.index, super.key});

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var backGroundPath = "$image${widget.results[widget.index].backdropPath}";
    var postarPath = "$image${widget.results[widget.index].posterPath}";
    bool isFavorite=false;

    return SafeArea(
      child: Stack(children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MovieDetailsScreen.routName,
                    arguments: MoreModel(
                        results: widget.results, index: widget.index));
                setState(() {});
              },
              child: Container(
                height: 227,
                width: 412,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  image: DecorationImage(
                    image: NetworkImage(
                      backGroundPath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 72,
              width: 400,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 160),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.results[widget.index].title}",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "${widget.results[widget.index].releaseDate}",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: 85,
            left: 170,
            child: Image.asset("assets/images/play-button-2.png")),
        Positioned(
            top: 100,
            left: 21,
            child: Container(
              height: 180,
              width: 129,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  postarPath,
                  fit: BoxFit.fill,
                ),
              ),
            )),
        Positioned(
            top: 100,
            left: 21,
            child: InkWell(
              onTap: () {
                addMovie();
                isFavorite=true;
                setState(() {
                });
              },
              child: Container(
                height: 36,
                width: 27,
                child: Image.asset(
                  isFavorite == false ?  "assets/images/bookmark.png":
                  "assets/images/watchlist_icon.png",
                  fit: BoxFit.fill,
                ),
              ),
            )),
      ]),
    );
  }

  void addMovie() {
    FirebaseServices.addMovieToFirestore(
            PouplrModelTry(results: widget.results, index: widget.index))
        .then((value) {
      print('Success');
    }).catchError((_) {
      print("Error,try again!");
    });
  }
}
