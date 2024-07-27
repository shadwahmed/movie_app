import '../../data/models/popular_response.dart';

class PouplrModelTry {

  PouplrModelTry({
    this.results,
    this.index,
    this.id='',
  });

  PouplrModelTry.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    index = json['index'];
    id = json['id'];
  }

  List<Results>? results;
  int? index;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['index'] = index;
    map['id'] = id;
    return map;
  }
}
