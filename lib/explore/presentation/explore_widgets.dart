import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/controller/explore_controller.dart';
import 'package:sonnet_sync/home/presentation/controller/home_controller.dart';
import 'package:sonnet_sync/poem_details.dart/presentation/poem_details_screen.dart';
import 'package:sonnet_sync/search_result/presentation/search_result.dart';

class ExploreWidgets {
  Widget textInput({required ExploreController controller}) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 45,
          child: TextField(
            controller: controller.textEditingController,
            textInputAction: TextInputAction.search,

            onChanged: (value) {
              log(value);
              if (value.isEmpty) {
                controller.isSearch.value = false;
              } else {
                controller.isSearch.value = true;
              }
            },
            onSubmitted: (value) {
              Get.to(
                transition: Transition.fade,
                duration: Duration(seconds: 2),
                SearchResult(query: value),
              );
            },
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            cursorColor: ColorsLight.whiteSepia,
            style: TextStyle(
              color: ColorsLight.whiteSepia,
              fontFamily: "handText",
              fontWeight: FontWeight.bold,
            ),
            cursorHeight: 20,
            decoration: InputDecoration(
              hintText: "Search Poem",
              hintStyle: TextStyle(
                color: ColorsLight.whiteSepia,
                fontSize: 14,
                fontFamily: "handText",
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 1),
              ),
            ),
          ),
        ),

        Positioned(
          right: 0,

          child: Obx(() {
            return controller.isSearch.value
                ? IconButton(
                  onPressed: () {
                    // controller.isSearch.value = !controller.isSearch.value;
                    controller.isSearch.value = false;
                    controller.textEditingController.clear();
                  },
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: ColorsLight.whiteSepia,
                    size: 30,
                  ),
                )
                : Container();
          }),
        ),
      ],
    );
  }

  Widget Authors(String autherName) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: ColorsLight.lightSepia,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Text(
        autherName,
        style: TextStyle(
          color: ColorsLight.darkSepia,
          fontFamily: "handText",
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget Suggestion({
    required String title,
    required String author,
    void func,
    List<String>? poem,
  }) {
    return ListTile(
      onTap: () {
        if (poem != null) {
          Get.to(
            transition: Transition.fade,
            duration: Duration(seconds: 2),
            PoemDetailsScreen(title: title, authorName: author, poem: poem),
          );
        }
      },
      leading: CircleAvatar(
        backgroundColor: ColorsLight.darkSepia,
        child: Text('🌟'),
      ),
      splashColor: ColorsLight.darkSepia,
      title: Text(
        maxLines: 2,
        title,
        style: TextStyle(
          color: ColorsLight.darkSepia,
          overflow: TextOverflow.ellipsis,
          fontFamily: "handText",
          fontWeight: FontWeight.w900,
        ),
      ),
      subtitle: Text(
        author,
        style: TextStyle(
          color: ColorsLight.darkSepia,
          fontFamily: "handText",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
