import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sonnet_sync/home/data/model/home_model.dart';

class GetPoems {
  Dio dio = Dio();
  final getRandomPoemuri = Uri.parse("https://poetrydb.org/random?count=1");
  Future<RandomPoem?> getRandomPoem() async {
    try {
      final response = await dio.getUri(getRandomPoemuri);
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        final data = RandomPoem.fromJson(response.data[0]);

        return data;
      }
    } catch (e) {
      log("failed to fetch  a random poem $e");
    }
    return null;
  }
}
