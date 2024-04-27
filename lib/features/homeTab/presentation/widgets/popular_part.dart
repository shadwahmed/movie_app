import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_manager.dart';

import '../../data/models/popular_response.dart';
import 'popular_item.dart';

class PopularPart extends StatelessWidget {
  PopularPart({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getPopular(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          }
          var resultList = snapshot.data?.results ?? [];
          return CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 50,
              height: 400,
              autoPlay: true,
            ),
            itemCount: resultList.length,
            itemBuilder: (context, index, realIndex) {
              return PopularItem(results: resultList, index: index);
            },
          );
        });
  }
}
