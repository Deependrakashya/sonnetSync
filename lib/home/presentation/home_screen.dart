import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/home/presentation/controller/home_controller.dart';
import 'package:sonnet_sync/home/presentation/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ColorsLight colorsLight = ColorsLight();
  HomeWidgets homeWidgets = HomeWidgets();
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsLight.darkSepia,
      body: SafeArea(
        child: Column(
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
                        homeWidgets.title("Sonnet Sync"),
                        IconButton(
                          onPressed: () {
                            homeController.isSearch.value =
                                !homeController.isSearch.value;
                          },
                          icon: Icon(
                            CupertinoIcons.search_circle_fill,
                            color: colorsLight.whiteSepia,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  );
            }),
          ],
        ),
      ),
    );
  }
}
