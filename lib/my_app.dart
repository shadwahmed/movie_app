import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/browse/presentation/pages/browse_tab.dart';
import 'package:movie_app/features/browse/presentation/pages/movieDiscover_tab.dart';
import 'package:movie_app/features/browse/presentation/widgets/movie_details_screenForCategory.dart';
import 'package:movie_app/features/home/presentation/pages/home_screen.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/for_releasesPart/movie_details_screen_forReleases.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/movie_details_screen.dart';
import 'package:movie_app/features/search/presentation/pages/search_tab.dart';
import 'package:movie_app/features/search/presentation/widgets/search_item.dart';
import 'features/homeTab/presentation/widgets/for_recomendedPart/movie_details_screen_forRecomended.dart';
import 'features/splash/splash_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412,870),
      minTextAdapt: true,
      child: MaterialApp(
        initialRoute: SplashScreen.routeName,
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.routeName: (context)=> SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          MovieDetailsScreen.routName:(context)=>MovieDetailsScreen(),
          MovieDetailsScreenForReleases.routName:(context)=>MovieDetailsScreenForReleases(),
          MovieDetailsScreenForRecomended.routName:(context)=>MovieDetailsScreenForRecomended(),
          SearchTab.routeName: (context)=> SearchTab(),
          BrowseTab.routeName: (context)=> BrowseTab(),
          MovieDetailsScreenForCategory.routName:(context)=> MovieDetailsScreenForCategory(),
          MovieDiscoverTab.routeName: (context)=> MovieDiscoverTab(),
        },
      ),
    );
  }
}






























