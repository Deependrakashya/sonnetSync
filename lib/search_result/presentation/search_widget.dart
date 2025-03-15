import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';

class SearchWidget {
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
