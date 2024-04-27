import 'package:flutter/material.dart';

class UnSearchItem extends StatelessWidget {
  const UnSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_movies,
            size: 120,
            color: Color(0xffB5B4B4),
          ),
          Text(
            "No movies found",
            style: TextStyle(color: Color(0xffB5B4B4)),
          ),
        ],
      ),
    );
  }
}
