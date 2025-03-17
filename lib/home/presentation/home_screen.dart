import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/home/presentation/controller/home_controller.dart';
import 'package:sonnet_sync/home/presentation/home_widgets.dart';
import 'package:sonnet_sync/poem_details.dart/presentation/poem_details_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeWidgets homeWidgets = HomeWidgets();

  HomeController homeController = HomeController();
  @override
  void initState() {
    homeController.fetchRandomPoem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.darkSepia,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return homeController.isSearch.value
                    ? Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      width: MediaQuery.of(context).size.width * 1,
                      child: homeWidgets.textInput(controller: homeController),
                    )
                    : Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          homeWidgets.title("Sonnet Sync", null),
                          IconButton(
                            onPressed: () {
                              homeController.isSearch.value =
                                  !homeController.isSearch.value;
                            },
                            icon: Icon(
                              CupertinoIcons.search_circle_fill,
                              color: ColorsLight.whiteSepia,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    );
              }),
              SizedBox(height: 30),

              homeWidgets.title("Recommended For You", 20),
              SizedBox(height: 15),
              Obx(() {
                return Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        duration: Duration(seconds: 1),
                        transition: Transition.fade,
                        PoemDetailsScreen(
                          title:
                              homeController.randomPoem.value.title.toString(),
                          authorName:
                              homeController.randomPoem.value.author.toString(),
                          poem: homeController.randomPoem.value.lines!.toList(),
                        ),
                      );
                    },
                    child: homeWidgets.Favourites(
                      title: homeController.randomPoem.value.title.toString(),
                      author: homeController.randomPoem.value.author.toString(),
                      description: homeController.formatPoem(
                        homeController.randomPoem.value.lines!.toList(),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homeWidgets.title("Yours Favourites", 20),
                    Icon(
                      CupertinoIcons.heart_fill,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Container(
              //   // height: MediaQuery.of(context).size.height * .20,
              //   child: ListView.builder(
              //     // scrollDirection: Axis.horizontal,
              //     physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: 0,
              //     itemBuilder:
              //         (index, context) => homeWidgets.Favourites(
              //           title: " this is a title",
              //           author: " William Sakespear",
              //           description: " this is poem",
              //         ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
