import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/home/presentation/controller/home_controller.dart';

class HomeWidgets {
  Widget title(String title, double? fontsize) {
    return Text(
      title,
      style: TextStyle(
        color: ColorsLight.whiteSepia,
        fontFamily: "handwritten",
        fontWeight: FontWeight.bold,
        fontSize: fontsize ?? 24,
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
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                borderSide: BorderSide(color: ColorsLight.whiteSepia, width: 2),
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

  Widget Favourites({
    required String title,
    String? author,
    String? description,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 100, minWidth: 300),
      // clipBehavior: Clip.,
      decoration: BoxDecoration(
        color: ColorsLight.lightSepia,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            offset: Offset.fromDirection(.2),
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: ColorsLight.darkSepia,
              fontFamily: "handText",
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 5),
          Text(
            author ?? '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: "handText",
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 15),
          Text(
            description ?? '',
            style: TextStyle(
              color: Colors.black,
              fontFamily: "handText",
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
