import 'package:flutter/material.dart';
import 'package:kbc/screens/bottom_navigation.dart';
import 'package:kbc/screens/home_page.dart';

import 'utility/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KBC TASK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        textTheme:AppTheme.instance.getTextTheme,
        scaffoldBackgroundColor: AppTheme.instance.colorWhite
      ),
      home:  MyBottomNavigationBar(),
    );
  }
}
