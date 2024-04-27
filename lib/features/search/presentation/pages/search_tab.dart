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
  List<Results> resultList = [];
  List<Results> originalList = [];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Container(
                height: 55,
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
                    searchController.text = value;
                    search(searchController.text);
                    print("================${searchController.text}");
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: FutureBuilder(
              future: searchController.text.isEmpty
                  ? null
                  : ApiManager.getSearch(searchController.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                resultList = snapshot.data?.results ?? [];
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
              })),
    );
  }

  // void search(String query) {
  //   ApiManager.getSearch(query);
  // }

   void search(String query) {
     setState(() {
       resultList = originalList.where((item) =>
           item.title!.toLowerCase().contains(query.toLowerCase())).toList();
     });
   }

}
