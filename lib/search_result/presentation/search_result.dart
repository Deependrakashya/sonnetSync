import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';
import 'package:sonnet_sync/explore/presentation/controller/explore_controller.dart';
import 'package:sonnet_sync/explore/presentation/explore_widgets.dart';
import 'package:sonnet_sync/search_result/presentation/search_widget.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});
  SearchWidget searchWidget = SearchWidget();
  ExploreController exploreController = ExploreController();
  ExploreWidgets exploreWidgets = ExploreWidgets();

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

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Apply Filters :",
                  style: TextStyle(
                    color: ColorsLight.whiteSepia,
                    fontFamily: "handText",
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    searchWidget.FilterButton(
                      title: 'by Authors',
                      ischecked: true,
                    ),
                    searchWidget.FilterButton(
                      title: 'by title',
                      ischecked: false,
                    ),
                    searchWidget.FilterButton(
                      title: 'everywhere',
                      ischecked: false,
                    ),
                  ],
                ),
              ),

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
