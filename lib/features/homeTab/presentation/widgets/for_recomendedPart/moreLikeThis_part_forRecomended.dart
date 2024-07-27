import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/for_recomendedPart/moreLikeThis_Item_forRecomended.dart';

import '../../../data/models/recomended_response.dart';

class MoreLikeThisPartForRecomendedPart extends StatelessWidget {

  List<Results> results;
  int index;
  MoreLikeThisPartForRecomendedPart({required this.results,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSimilar(results[index].id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          }
          var resultList = snapshot.data?.results ?? [];
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 1,
              crossAxisSpacing: 20,
              mainAxisExtent: 100,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: MoreLikeThisItemForRecomendedPart(
                results: resultList,
                index: index,
              ),
            ),
            itemCount: results.length,
          );
        });
  }
}
