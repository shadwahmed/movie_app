import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/browse/presentation/pages/browse_tab.dart';
import 'package:movie_app/features/homeTab/presentation/pages/home_tab.dart';
import 'package:movie_app/features/search/presentation/pages/search_tab.dart';
import 'package:movie_app/features/watchlist/presentation/pages/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      bottomNavigationBar: BottomAppBar(
        height: 66,
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: Color(0xffFFBB3B),
          unselectedItemColor: Color(0xffC6C6C6),
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          backgroundColor: AppColor.btmBarColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 25), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie, size: 25), label: 'BROWSE'),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark, size: 25),
                label: 'WATCHLIST'),
          ],
        ),
      ),
      body: tabs[index],
    );
  }
}

List<Widget> tabs = [
  HomeTab(),
  SearchTab(),
  BrowseTab(),
  WatchlistTab(),
];
