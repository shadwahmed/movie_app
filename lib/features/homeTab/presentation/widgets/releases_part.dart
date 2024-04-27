import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_manager.dart';

import 'release_item.dart';

class ReleasesPart extends StatelessWidget {
  const ReleasesPart({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getReleases(),
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
          itemBuilder: (_, index) => ReleaseItem(
            results: resultList,
            index: index,
          ),
          itemCount: resultList.length,
        );
      },
    );
  }
}
