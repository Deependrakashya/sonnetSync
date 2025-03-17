import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sonnet_sync/search_result/data/model/search_model.dart';

class SearchResultRepo {
  Dio dio = Dio();

  Future<SearchPoem?> findSearch({
    required String query,
    bool? isauthor,
  }) async {
    isauthor ??= false;

    Uri titleUri = Uri.parse('https://poetrydb.org/title/$query');
    Uri authorUri = Uri.parse('https://poetrydb.org/author/$query');
    Uri uri = isauthor ? authorUri : titleUri;

    log("Fetching from: $uri");

    try {
      final res = await dio.getUri(uri);
      log("Response Data: ${res.data}");

      if (res.data is List && res.statusCode == 200) {
        return SearchPoem.fromJson(res.data); // Parse as list
      } else {
        return SearchPoem.fromJson([
          {
            "title": "Result not Found",
            "author": "",
            "lines": [""],
          },
        ]);
      }
    } catch (e) {
      log("error fetching suggestions $e");
    }
    return null;
  }
}
