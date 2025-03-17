import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/search_result/presentation/controller/search_result_controller.dart';
import 'package:sonnet_sync/search_result/presentation/search_result.dart';

class SearchWidget {
  Widget textInput({required SearchResultController controller}) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 40,
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
              controller.searchPoems();
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

  Widget FilterButton({required String title, required bool ischecked}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        color: ischecked ? ColorsLight.lightSepia : ColorsLight.darkSepia,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: ischecked ? ColorsLight.darkSepia : ColorsLight.whiteSepia,
              fontFamily: "handText",
              fontWeight: FontWeight.w900,
            ),
          ),
          ischecked
              ? Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(CupertinoIcons.minus, size: 20),
              )
              : Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(CupertinoIcons.add, size: 20),
              ),
        ],
      ),
    );
  }
}
