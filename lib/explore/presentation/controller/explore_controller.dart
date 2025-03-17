import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonnet_sync/explore/data/model/explore_model.dart';
import 'package:sonnet_sync/explore/domain/explore_repo.dart';

class ExploreController extends GetxController {
  RxBool isSearch = false.obs;
  RxBool isTextEditorValue = false.obs;
  RxBool isloadingSuggestin = true.obs;
  TextEditingController textEditingController = TextEditingController();
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
  var suggestionsList = Suggestions(poems: []).obs;

  ExploreRepo exploreRepo = ExploreRepo();
  void fetchAuthors() async {
    final res = await exploreRepo.findAuthors();
    if (res != null) {
      authorsList.value = res.authors as List;
      log(res.authors![0].toString());
    }
  }

  void fetchSuggetions() async {
    isloadingSuggestin.value = true;
    final res = await exploreRepo.findSuggestion();
    if (res != null) {
      suggestionsList.value = res;

      isloadingSuggestin.value = false;
    }
    // isloadingSuggestin.value = false;
  }

  void authorTap(String author) {
    textEditingController.text = author;
  }
}
