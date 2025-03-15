import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/controller/explore_controller.dart';

class ExploreWidgets {
  Widget textInput({required ExploreController controller}) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 40,
          child: TextField(
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            cursorColor: ColorsLight.whiteSepia,
            style: TextStyle(
              color: ColorsLight.whiteSepia,
              fontFamily: "handwritten",
              fontWeight: FontWeight.bold,
            ),
            cursorHeight: 20,
            decoration: InputDecoration(
              hintText: "Search Poem",
              hintStyle: TextStyle(
                color: ColorsLight.whiteSepia,
                fontSize: 14,
                fontFamily: "handwritten",
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 1),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,

          child: IconButton(
            onPressed: () {
              controller.isSearch.value = !controller.isSearch.value;
            },
            icon: Icon(
              Icons.cancel_rounded,
              color: ColorsLight.whiteSepia,
              size: 30,
            ),
          ),
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
        borderRadius: BorderRadius.circular(20),
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
}
