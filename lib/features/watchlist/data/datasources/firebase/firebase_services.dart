import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/features/homeTab/data/models/popular_response.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/pouplrModelTry.dart';

class FirebaseServices {
  static CollectionReference<PouplrModelTry> getWatchlistCollection() =>
      FirebaseFirestore.instance
          .collection('watchlist')
          .withConverter<PouplrModelTry>(
              fromFirestore: (snapshot, _) =>
                  PouplrModelTry.fromJson(snapshot.data()!),
              toFirestore: (PouplrModelTry, _) => PouplrModelTry.toJson());

  static Future<void> addMovieToFirestore(PouplrModelTry movie) {
    final movieCollection = getWatchlistCollection();
    final doc = movieCollection.doc();
    movie.id=doc.id;
    return doc.set(movie);
  }

  static Future<List<PouplrModelTry>> getAllTasksFromFirestore() async {
    final watchListCollection = getWatchlistCollection();
    final querySnapshot = await watchListCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<QuerySnapshot<PouplrModelTry>> getWatchlist() {
    return getWatchlistCollection().get();
  }

  static Future<void> deleteMovie(String id) {
    return getWatchlistCollection().doc(id).delete();
  }
}
