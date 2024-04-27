import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/pages/home_screen.dart';
import 'package:movie_app/features/homeTab/presentation/widgets/movie_details_screen.dart';
import 'package:movie_app/features/search/presentation/pages/search_tab.dart';
import 'package:movie_app/features/search/presentation/widgets/search_item.dart';
import 'package:movie_app/features/search/presentation/widgets/search_part.dart';
import 'features/splash/splash_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412,870),
      minTextAdapt: true,
      child: MaterialApp(
        initialRoute: SearchTab.routeName,
        debugShowCheckedModeBanner: false,
        routes: {
          SearchTab.routeName: (context)=> SearchTab(),
          SplashScreen.routeName: (context)=> SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          MovieDetailsScreen.routName:(context)=>MovieDetailsScreen(),
        },
      ),
    );
  }
}






























