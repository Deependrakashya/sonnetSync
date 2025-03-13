import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/home/presentation/controller/home_controller.dart';

class HomeWidgets {
  ColorsLight colorsLight = ColorsLight();
  Widget title(String title) {
    return Text(
      title,
      style: TextStyle(
        color: colorsLight.whiteSepia,
        fontFamily: "handwritten",
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget textInput({required HomeController controller}) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 40,
          child: TextField(
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            cursorColor: colorsLight.whiteSepia,
            style: TextStyle(
              color: colorsLight.whiteSepia,
              fontFamily: "handwritten",
              fontWeight: FontWeight.bold,
            ),
            cursorHeight: 20,
            decoration: InputDecoration(
              hintText: "Search Poem",
              hintStyle: TextStyle(
                color: colorsLight.whiteSepia,
                fontSize: 14,
                fontFamily: "handwritten",
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                borderSide: BorderSide(color: colorsLight.whiteSepia, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                borderSide: BorderSide(color: colorsLight.whiteSepia, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                borderSide: BorderSide(color: colorsLight.whiteSepia, width: 2),
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
              color: colorsLight.whiteSepia,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
