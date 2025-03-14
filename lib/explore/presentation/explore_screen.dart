import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/controller/explore_controller.dart';
import 'package:sonnet_sync/explore/presentation/explore_widgets.dart';
import 'package:sonnet_sync/home/presentation/home_widgets.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  ColorsLight colorsLight = ColorsLight();
  ExploreWidgets exploreWidgets = ExploreWidgets();
  ExploreController exploreController = ExploreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsLight.darkSepia,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [exploreWidgets.textInput(controller: exploreController)],
          ),
        ),
      ),
    );
  }
}
