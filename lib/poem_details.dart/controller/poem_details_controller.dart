import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sonnet_sync/explore/data/model/explore_model.dart';

class PoemDetailsController extends GetxController {
  RxBool isfav = false.obs;
  var favPoem;
  void addToFav({
    required String title,
    required String author,
    required List<String> poem,
  }) async {
    final box = Hive.box('poemsBox');
    box.put(favPoem, Poem(title: title, author: author, lines: poem));
  }
}
