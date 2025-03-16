import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';

class PoemDetailsScreen extends StatelessWidget {
  final String title;
  final String authorName;
  final String poem;
  PoemDetailsScreen({
    super.key,
    required this.title,
    required this.authorName,
    required this.poem,
  });

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
                      onPressed: () {},
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
                        authorName,
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handwritten",
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
                    borderRadius: BorderRadius.circular(20),
                    color: ColorsLight.darkSepia,
                    border: Border.all(width: 1, color: ColorsLight.whiteSepia),
                  ),
                  width: MediaQuery.of(context).size.width * .9,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * .8,
                  ),

                  child: Column(
                    spacing: 10,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        title,
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        poem,
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",

                          fontSize: 16,
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
