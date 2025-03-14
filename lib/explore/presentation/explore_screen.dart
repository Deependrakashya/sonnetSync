import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/controller/explore_controller.dart';
import 'package:sonnet_sync/explore/presentation/explore_widgets.dart';
import 'package:sonnet_sync/home/presentation/home_widgets.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  ExploreWidgets exploreWidgets = ExploreWidgets();
  HomeWidgets homeWidgets = HomeWidgets();
  ExploreController exploreController = ExploreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.darkSepia,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: exploreWidgets.textInput(controller: exploreController),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (index, context) {
                    return exploreWidgets.Authors("autherNameauther");
                  },
                ),
              ),
              SizedBox(height: 20),
              homeWidgets.title("Suggestions for you", 20),
              SizedBox(height: 15),

              Container(
                child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (index, context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: ColorsLight.lightSepia,

                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          backgroundColor: ColorsLight.darkSepia,
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
                    );

                    // homeWidgets.Favourites(title: "this is title ");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
