import 'dart:developer';

import 'package:get/get.dart';
import 'package:sonnet_sync/explore/domain/explore_repo.dart';

class ExploreController extends GetxController {
  RxBool isSearch = false.obs;
  RxList authorsList =
      <String>[
        "William Shakespeare",
        "William Topaz McGonagall",
        "William Vaughn Moody",
        "William Wordsworth",
        "Charles Sorley",
        "Charlotte Bronte",
        "Charlotte Smith",
      ].obs;
  ExploreRepo exploreRepo = ExploreRepo();
  void fetchAuthors() async {
    final res = await exploreRepo.findAuthors();
    if (res != null) {
      authorsList.value = res.authors as List;
      log(res.authors![0].toString());
    }
  }
}
