import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/api/api_manager.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/search_response.dart';
import '../widgets/search_item.dart';
import '../widgets/unsearch_item.dart';

class SearchTab extends StatefulWidget {
  static const String routeName = "searchTab";

  SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  List<Results> resultList = [];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Container(
                height: 50,
                width: 350,
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: Color(0xff514F4F),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white54),
                    hintText: ' Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: Color(0xffB5B4B4), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Color(0xffB5B4B4), width: 2)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      ApiManager.getSearch(value).then((results) {
                        resultList = results.results ?? [];
                      });
                    });
                    print(
                        "========================${resultList}"); //searchController.text = value;
                    //search(searchController.text);
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: ApiManager.getSearch(searchController.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text("Something went wrong"));
                      }
                      print(snapshot.data);
                      print(resultList);

                      if (resultList.isEmpty) {
                        return UnSearchItem();
                      }
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            return SearchItem(
                              results: resultList,
                              index: index,
                            );
                          },
                          itemCount: resultList.length);
                    }),
              ),
            ],
          )),
    );
  }
}
//   void search(String query) {
//     if (query.isNotEmpty) {
//       ApiManager.getSearch(query).then((response) {
//         setState(() {
//           resultList = response.results ?? [];
//         });
//       }).catchError((error) {
//         setState(() {
//           resultList = []; // Reset the resultList if an error occurs
//         });
//       });
//     } else {
//       setState(() {
//         resultList = []; // Reset the resultList if the query is empty
//       });
//     }
//   }
// }
// void search(String query) {
//   ApiManager.getSearch(query);
// }
//
//   void search(String query) {
//     setState(() {
//        ApiManager.getSearch(query);
//     });
//   }
// }
