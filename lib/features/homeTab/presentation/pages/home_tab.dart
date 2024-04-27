import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/popular_part.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/recomended_part.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/releases_part.dart';

class HomeTab extends StatelessWidget {

  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: PopularPart()),
        Container(
          color: Color(0xff282A28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 2),
                child: Text(
                  "New Releases ",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 2, bottom: 8),
                child: Container(height: 120, child: ReleasesPart()),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Color(0xff282A28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 2),
                child: Text(
                  "Recomended ",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 2, bottom: 8),
                child: Container(height: 160, child: RecomendedPart()),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
