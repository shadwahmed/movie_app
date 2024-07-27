import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/features/browse/data/models/category_model.dart';
import 'package:movie_app/features/browse/presentation/pages/browse_tab.dart';
import 'package:movie_app/features/browse/presentation/widgets/category_item.dart';
import 'package:movie_app/features/browse/presentation/widgets/movieDiscover_item.dart';
import 'package:movie_app/features/home/presentation/pages/home_screen.dart';
import '../../../../core/api/api_manager.dart';
import '../widgets/movie_try.dart';

class MovieDiscoverTab extends StatelessWidget {
  static const String routeName = 'movieDiscoverTab';

  const MovieDiscoverTab({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MovieDiscoverItem;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.white,
                    )),
                Text("${args.categoryApi[args.index].name}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            FutureBuilder(
                future: ApiManager.getMovieDiscover(
                    "${args.categoryApi[args.index].id}"),
                builder: (context, snapshot) {
                  print("${args.categoryApi[args.index].id}");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  var resultList = snapshot.data?.results ?? [];
                  print("============================${resultList}");
                  return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return MovieTry(
                              results: resultList,
                              movieDiscoverItem: MovieDiscoverItem(
                                  categoryApi: args.categoryApi, index: index));
                        },
                        itemCount: resultList.length),
                  );
                })
          ],
        ),
      ),
    );
  }
}
