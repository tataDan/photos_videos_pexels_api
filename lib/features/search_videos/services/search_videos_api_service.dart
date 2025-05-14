import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/api_constants.dart';
import '../models/search_videos_model.dart';

class SearchVideosApiService {
  SearchVideosApiService(this.searchText);
  String searchText;

  Future<SearchVideosModel> fetchVideos({required int page}) async {
    final url = Uri.parse(
      '${ApiConstants.videoBaseUrl}/search?query=$searchText&page=$page',
    );
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return SearchVideosModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch video: ${response.statusCode}');
    }
  }
}
