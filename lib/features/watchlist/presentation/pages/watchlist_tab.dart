import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/watchlist/data/datasources/firebase/firebase_services.dart';
import 'package:movie_app/features/watchlist/presentation/widgets/watchlist_item.dart';
import '../../../homeTab/presentation/widgets/pouplrModelTry.dart';

class WatchlistTab extends StatefulWidget {
  const WatchlistTab({super.key});

  @override
  State<WatchlistTab> createState() => _WatchlistTabState();
}

class _WatchlistTabState extends State<WatchlistTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 16),
              child: Text(
                "Watchlist",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot<PouplrModelTry>>(
                  future: FirebaseServices.getWatchlist(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Something went wrong"));
                    }
                    var watchList =
                        snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

                    if(watchList.isEmpty){
                      return Center(child: Text("Watchlist Is Empty",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),));
                    }
                    return Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return WatchListItem(
                              MovieItem: watchList[index],
                                // index: index,
                                // results: watchList[index].results,
                              );
                          },
                          itemCount: watchList.length),
                    );
                  }),
            )
          ],
          
        ),
      ),
    );
  }
}
