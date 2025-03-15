import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonnet_sync/core/constants.dart';

class PoemDetailsScreen extends StatelessWidget {
  const PoemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.darkSepia,
      body: SafeArea(
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.back,
                        color: ColorsLight.whiteSepia,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Author Name ',
                      style: TextStyle(
                        color: ColorsLight.whiteSepia,
                        fontFamily: "handwritten",
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.heart,
                    color: ColorsLight.whiteSepia,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorsLight.darkSepia,
                    border: Border.all(width: 1, color: ColorsLight.whiteSepia),
                  ),
                  width: MediaQuery.of(context).size.width * .9,

                  child: Column(
                    spacing: 10,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "Title of the poem ",
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '''
"Helen, thy beauty is to me"
	"  Like those Nicean barks of yore,"
	"That gently, o'er a perfumed sea,"
	"  The weary, wayworn wanderer bore"
	"  To his own native shore."

	"On desperate seas long wont to roam,"
	"  Thy hyacinth hair, thy classic face,"
	"Thy Naiad airs have brought me home"
	"  To the glory that was Greece,"
	"To the grandeur that was Rome."
	""
	"Lo! in yon brilliant window niche,"
	"  How statue-like I see thee stand,"
	"  The agate lamp within thy hand!"
	"Ah, Psyche, from the regions which"
	"  Are Holy Land!" 
  	"Lo! in yon brilliant window niche,"
	"  How statue-like I see thee stand,"
	"  The agate lamp within thy hand!"
	"Ah, Psyche, from the regions which"
	"  Are Holy Land!" 
               ''',
                        style: TextStyle(
                          color: ColorsLight.whiteSepia,
                          fontFamily: "handText",

                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
