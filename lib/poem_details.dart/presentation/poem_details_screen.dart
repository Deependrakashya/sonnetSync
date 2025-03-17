import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/home/presentation/controller/home_controller.dart';

class PoemDetailsScreen extends StatefulWidget {
  final String title;
  final String authorName;
  final List<String> poem;

  PoemDetailsScreen({
    super.key,
    required this.title,
    required this.authorName,
    required this.poem,
    required,
  });

  @override
  State<PoemDetailsScreen> createState() => _PoemDetailsScreenState();
}

class _PoemDetailsScreenState extends State<PoemDetailsScreen> {
  void addFav() {
    Hive.box('poem');
  }

  late String formattedPoem;
  @override
  void initState() {
    formattedPoem = HomeController().formatPoem(widget.poem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.darkSepia,
      body: SafeArea(
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        color: ColorsLight.whiteSepia,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      alignment: Alignment.centerLeft,

                      height: 40,
                      child: Text(
                        widget.authorName,
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.heart,
                    color: ColorsLight.whiteSepia,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorsLight.darkSepia,
                    border: Border.all(width: 1, color: ColorsLight.whiteSepia),
                  ),
                  width: MediaQuery.of(context).size.width * .95,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * .8,
                  ),

                  child: Column(
                    spacing: 10,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        // maxLines: 3,
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",
                          // overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        formattedPoem,
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",

                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "* * * * * * * * * * * * * * ",
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",

                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
