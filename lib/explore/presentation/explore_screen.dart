import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/controller/explore_controller.dart';
import 'package:sonnet_sync/explore/presentation/explore_widgets.dart';
import 'package:sonnet_sync/home/presentation/controller/home_controller.dart';
import 'package:sonnet_sync/home/presentation/home_widgets.dart';
import 'package:sonnet_sync/poem_details.dart/presentation/poem_details_screen.dart';
import 'package:sonnet_sync/search_result/presentation/controller/search_result_controller.dart';
import 'package:sonnet_sync/search_result/presentation/search_result.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ExploreWidgets exploreWidgets = ExploreWidgets();

  HomeWidgets homeWidgets = HomeWidgets();

  ExploreController exploreController = ExploreController();
  @override
  void initState() {
    exploreController.fetchAuthors();
    exploreController.fetchSuggetions();
    super.initState();
  }

  void navigatePeomDetails({
    required String title,
    required String author,
    required List<dynamic> poem,
  }) {}
  void search(String query) {
    Get.to(
      transition: Transition.fade,
      duration: Duration(seconds: 2),
      SearchResult(query: query, isauthor: true),
    );
    exploreController.textEditingController.text = query;
    exploreController.isSearch.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.darkSepia,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: exploreWidgets.textInput(controller: exploreController),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Obx(() {
                      return Container(
                        height: 40,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: exploreController.authorsList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                search(
                                  exploreController.authorsList[index]
                                      .toString(),
                                );
                              },
                              child: exploreWidgets.Authors(
                                exploreController.authorsList[index].toString(),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    SizedBox(height: 20),
                    homeWidgets.title("Suggestions for you", 20),
                    SizedBox(height: 15),

                    Container(
                      child: Obx(() {
                        return ListView.builder(
                          itemCount:
                              exploreController.isloadingSuggestin.value
                                  ? 10
                                  : exploreController
                                      .suggestionsList
                                      .value
                                      .poems
                                      .length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: ColorsLight.lightSepia,

                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:
                                  exploreController.isloadingSuggestin.value
                                      ? Skeletonizer(
                                        effect: ShimmerEffect(),
                                        child: exploreWidgets.Suggestion(
                                          title: " titletitletitletitleti",
                                          author: 'author',
                                        ),
                                      )
                                      : exploreWidgets.Suggestion(
                                        title:
                                            exploreController
                                                .suggestionsList
                                                .value
                                                .poems[index]
                                                .title
                                                .toString(),
                                        author:
                                            exploreController
                                                .suggestionsList
                                                .value
                                                .poems[index]
                                                .author
                                                .toString(),
                                        poem:
                                            exploreController
                                                .suggestionsList
                                                .value
                                                .poems[index]
                                                .lines,
                                      ),
                            );

                            // homeWidgets.Favourites(title: "this is title ");
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
