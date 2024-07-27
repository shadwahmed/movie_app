import 'package:flutter/material.dart';
import 'package:movie_app/features/browse/presentation/widgets/more_modelForCategory.dart';
import 'package:movie_app/features/browse/presentation/widgets/movie_details_screenForCategory.dart';
import '../../../browse/data/models/movieDiscover_response.dart';
import 'movieDiscover_item.dart';

class MovieTry extends StatelessWidget {
  List<Results> results;
  MovieDiscoverItem movieDiscoverItem;

  MovieTry({required this.results, required this.movieDiscoverItem, super.key});

  @override
  Widget build(BuildContext context) {
    var image = "https://image.tmdb.org/t/p/w500";
    var finalPath = "$image${results[movieDiscoverItem.index].backdropPath}";
    return SafeArea(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, MovieDetailsScreenForCategory.routName,
            arguments: MoreModelForSearch(index: movieDiscoverItem.index, results: results ,));},
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(finalPath,height: 80,
                        fit: BoxFit.fill,
                        width: 140,)),
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
                          "${results[movieDiscoverItem.index].title}",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${results[movieDiscoverItem.index].releaseDate}",
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.67)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${results[movieDiscoverItem.index].originalLanguage}",
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
