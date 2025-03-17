import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/explore_screen.dart';
import 'package:sonnet_sync/home/presentation/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('poemsBox');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List screens = [HomeScreen(), ExploreScreen()];

  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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

            borderRadius: BorderRadius.circular(30),
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
