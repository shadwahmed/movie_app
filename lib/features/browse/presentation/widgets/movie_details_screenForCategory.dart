import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/features/browse/presentation/widgets/more_modelForCategory.dart';

class MovieDetailsScreenForCategory extends StatelessWidget {
  static const String routName = 'movieDetailsForCategory';

  const MovieDetailsScreenForCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MoreModelForSearch;
    var image = "https://image.tmdb.org/t/p/w500";
    var backGroundPath = "$image${args.results[args.index].backdropPath}";
    var postarPath = "$image${args.results[args.index].posterPath}";
    //var results = ModalRoute.of(context)!.settings.arguments as List<Results> ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "${args.results[args.index].title}",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff282A28),
          // leading: Icon(
          //   Icons.arrow_back,
          //   color: Colors.white,
          // ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(backGroundPath),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Center(
                      child: Image.asset("assets/images/play-button-2.png")),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                "${args.results[args.index].title}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                "${args.results[args.index].releaseDate}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          postarPath,
                          height: 180,
                        ),
                      ),
                      Image.asset("assets/images/bookmark.png"),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(9),
                    height: 190,
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.white),
                                  color: Colors.black,
                                ),
                                child: Text(
                                  "Action",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.white),
                                  color: Colors.black,
                                ),
                                child: Text(
                                  "Drama",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.white),
                                  color: Colors.black,
                                ),
                                child: Text(
                                  "Comedy",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.white),
                              color: Colors.black,
                            ),
                            child: Text(
                              "Animation",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 220,
                          child: SingleChildScrollView(
                            child: Text(
                              "${args.results[args.index].overview}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 26,
                              color: Color(0xffFFBB3B),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${args.results[args.index].voteAverage}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
