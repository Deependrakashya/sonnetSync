import 'dart:developer';

import 'package:get/get.dart';
import 'package:sonnet_sync/home/data/model/home_model.dart';
import 'package:sonnet_sync/home/domain/get_random_poem.dart';

class HomeController extends GetxController {
  RxBool isSearch = false.obs;

  var randomPoem =
      RandomPoem(
        title: 'To Harriet',
        author: "George Gordon, Lord Byron",
        lines: [
          "Harriet! to see such Circumspection,",
          "In Ladies I have no objection",
          "  Concerning what they read;",
          "An ancient Maid's a sage adviser,",
          "Like _her_, you will be much the wiser,",
          "  In word, as well as Deed.",
          "",
          "But Harriet, I don't wish to flatter,",
          "And really think 't would make the matter",
          "  More perfect if not quite,",
          "If other Ladies when they preach,",
          "Would certain Damsels also teach",
          "  More cautiously to write.",
        ],
        linecount: '12',
      ).obs;
  GetPoems getPoems = GetPoems();
  void fetchRandomPoem() async {
    RandomPoem? data = await getPoems.getRandomPoem();
    if (data != null) {
      randomPoem.value = data;
      // log(data.lines.toString());
    }

    //  else {
    //   randomPoem.value = RandomPoem(
    //
    // }
  }

  String formatPoem(List<dynamic> rawPoem) {
    // log(rawPoem.toString());
    String poem = rawPoem.join(" "); // Convert list to a single string
    poem = poem.replaceAll(RegExp(r'\[|\]'), ''); // Remove brackets
    poem = poem.replaceAll(
      RegExp(r'\s*,,\s*|\s*;\s*'),
      '\n',
    ); // Replace ,, (with optional spaces) with a newline
    poem = poem.trim(); // Remove extra spaces

    return poem;
  }
}
