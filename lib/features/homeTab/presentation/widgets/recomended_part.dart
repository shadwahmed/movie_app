import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/Recomended_item.dart';


class RecomendedPart extends StatelessWidget {
  const RecomendedPart({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getRecomended(),
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
              child: RecomendedItem(
                results: resultList,
                index: index,
              ),
            ),
            itemCount: resultList.length,
          );
        });
  }
}
