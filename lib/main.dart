import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/home/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sonnet Sync',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsLight().darkSepia),
      ),
      home: HomeScreen(),
    );
  }
}
