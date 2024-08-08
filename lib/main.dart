import 'package:flutter/material.dart';
import 'package:news_app_project/ui/board/board_screen.dart';
import 'package:news_app_project/ui/new_screen/news_screen.dart';
import 'package:news_app_project/utils/theme/theme.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      theme: MyThemeData.lightMode,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        NewsScreen.routeName: (context) => NewsScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
