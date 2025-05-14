import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/api_constants.dart';
import '../models/popular_videos_model.dart';

class PopularVideosApiService {
  PopularVideosApiService();

  Future<PopularVideosModel> fetchVideos({required int page}) async {
    final url = Uri.parse('${ApiConstants.videoBaseUrl}/popular?page=$page');
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return PopularVideosModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch popular videos: ${response.statusCode}');
    }
  }
}
