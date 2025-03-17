import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sonnet_sync/explore/data/model/explore_model.dart';

class ExploreRepo {
  final Uri authorsUri = Uri.parse('https://poetrydb.org/author?count=20');
  final Uri suggetstionsUri = Uri.parse('https://poetrydb.org/title/author');
  Dio dio = Dio();
  Future<Authors?> findAuthors() async {
    try {
      var response = await dio.getUri(authorsUri);
      if (response.statusCode == 200 && response.data != null) {
        Authors authors = Authors.fromJson(response.data);
        log("Fetched Authors: ${authors}");
        return authors;
      }
    } catch (e) {
      log("error fetching Authors $e");
      return null;
    }
  }

  Future<Suggestions?> findSuggestion() async {
    try {
      var response = await dio.getUri(suggetstionsUri);
      if (response.data is List) {
        return Suggestions.fromJson(response.data); // Parse as list
      }
    } catch (e) {
      log("error fetching suggestions $e");
    }
    return null;
  }
}
