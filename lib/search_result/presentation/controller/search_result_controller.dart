import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonnet_sync/search_result/data/model/search_model.dart';
import 'package:sonnet_sync/search_result/domain/search_result_repo.dart';

class SearchResultController extends GetxController {
  RxBool isloading = true.obs;
  RxBool isauthor = false.obs;
  RxBool isSearch = false.obs;
  RxBool isError = false.obs;
  RxBool isTextEditorValue = false.obs;
  RxBool isloadingSuggestin = true.obs;

  var searchResultList = SearchPoem(poems: []).obs; // Corrected List Type
  TextEditingController textEditingController = TextEditingController();
  SearchResultRepo searchResultRepo = SearchResultRepo();

  void searchPoems() async {
    isloading.value = true;
    searchResultList.value.poems.clear();
    var res = await searchResultRepo.findSearch(
      query: textEditingController.text,
      isauthor: isauthor.value,
    );

    if (res != null) {
      searchResultList.value = res; // Wrap in a List
      isloading.value = false;
    } else {
      isError.value = true;
      isloading.value = false;
    }
  }
}
