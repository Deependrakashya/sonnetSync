import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/explore_screen.dart';
import 'package:sonnet_sync/home/presentation/home_screen.dart';
import 'package:sonnet_sync/poem_details.dart/presentation/poem_details_screen.dart';
import 'package:sonnet_sync/search_result/presentation/search_result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List screens = [PoemDetailsScreen(), ExploreScreen()];

  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sonnet Sync',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsLight.darkSepia),
      ),
      home: Scaffold(
        body: screens[currentPage],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.amber,

            borderRadius: BorderRadius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: currentPage,

            backgroundColor: ColorsLight.lightSepia,
            onTap: (index) {
              changePage(index);
              log(" index of pages $index");
            },

            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(Icons.explore_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
