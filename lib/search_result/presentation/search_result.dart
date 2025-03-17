import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/controller/explore_controller.dart';
import 'package:sonnet_sync/explore/presentation/explore_widgets.dart';
import 'package:sonnet_sync/home/presentation/controller/home_controller.dart';
import 'package:sonnet_sync/poem_details.dart/presentation/poem_details_screen.dart';
import 'package:sonnet_sync/search_result/presentation/controller/search_result_controller.dart';
import 'package:sonnet_sync/search_result/presentation/search_widget.dart';

class SearchResult extends StatefulWidget {
  final String query;
  bool? isauthor;
  SearchResult({super.key, required this.query, this.isauthor});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  SearchWidget searchWidget = SearchWidget();
  SearchResultController searchResultController = SearchResultController();
  @override
  void initState() {
    searchResultController.textEditingController.text = widget.query;
    searchResultController.isauthor.value = widget.isauthor ?? false;

    if (widget.query.isNotEmpty) {
      searchResultController.searchPoems();
    }
    searchResultController.isSearch.value = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.darkSepia,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  margin: EdgeInsets.all(10),
                  child: searchWidget.textInput(
                    controller: searchResultController,
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Apply Filters :",
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        spacing: 10,
                        children: [
                          Obx(() {
                            return InkWell(
                              onTap: () {
                                log(
                                  searchResultController.isauthor.value
                                      .toString(),
                                );
                                searchResultController.isauthor.value =
                                    !searchResultController.isauthor.value;
                                searchResultController.searchPoems();
                              },
                              child: searchWidget.FilterButton(
                                title: 'by title',
                                ischecked:
                                    !searchResultController.isauthor.value,
                              ),
                            );
                          }),
                          Obx(() {
                            return InkWell(
                              onTap: () {
                                log(
                                  searchResultController.isauthor.value
                                      .toString(),
                                );

                                searchResultController.isauthor.value =
                                    !searchResultController.isauthor.value;
                                searchResultController.searchPoems();
                              },
                              child: searchWidget.FilterButton(
                                title: 'by Authors',
                                ischecked:
                                    searchResultController.isauthor.value,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    Obx(() {
                      return Container(
                        child: ListView.builder(
                          itemCount:
                              searchResultController.isloading.value
                                  ? 20
                                  : searchResultController
                                      .searchResultList
                                      .value
                                      .poems
                                      .length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Obx(() {
                              return searchResultController.isloading.value &&
                                      searchResultController
                                          .searchResultList
                                          .value
                                          .poems
                                          .isEmpty
                                  ? Skeletonizer(
                                    effect: ShimmerEffect(),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorsLight.lightSepia,

                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ListTile(
                                        onTap: () {},
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              ColorsLight.darkSepia,
                                          child: Text('🌟'),
                                        ),
                                        splashColor: ColorsLight.darkSepia,
                                        title: Text(
                                          "this is title",
                                          style: TextStyle(
                                            color: ColorsLight.darkSepia,
                                            fontFamily: "handText",
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "Authors",
                                          style: TextStyle(
                                            color: ColorsLight.darkSepia,
                                            fontFamily: "handText",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  : Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorsLight.lightSepia,

                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        if (searchResultController
                                                .searchResultList
                                                .value
                                                .poems[index]
                                                .title !=
                                            "Result not Found") {
                                          Get.to(
                                            duration: Duration(seconds: 2),
                                            transition: Transition.fade,
                                            PoemDetailsScreen(
                                              title:
                                                  searchResultController
                                                      .searchResultList
                                                      .value
                                                      .poems[index]
                                                      .title
                                                      .toString(),
                                              authorName:
                                                  searchResultController
                                                      .searchResultList
                                                      .value
                                                      .poems[index]
                                                      .author
                                                      .toString(),
                                              poem:
                                                  searchResultController
                                                      .searchResultList
                                                      .value
                                                      .poems[index]
                                                      .lines,
                                            ),
                                          );
                                        }
                                      },
                                      leading: CircleAvatar(
                                        backgroundColor: ColorsLight.darkSepia,
                                        child: Text('🌟'),
                                      ),
                                      splashColor: ColorsLight.darkSepia,
                                      title: Text(
                                        searchResultController
                                            .searchResultList
                                            .value
                                            .poems[index]
                                            .title
                                            .toString(),
                                        style: TextStyle(
                                          color: ColorsLight.darkSepia,
                                          fontFamily: "handText",
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      subtitle: Text(
                                        searchResultController
                                            .searchResultList
                                            .value
                                            .poems[index]
                                            .author
                                            .toString(),
                                        style: TextStyle(
                                          color: ColorsLight.darkSepia,
                                          fontFamily: "handText",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  );
                            });
                          },
                        ),
                      );
                    }),
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
