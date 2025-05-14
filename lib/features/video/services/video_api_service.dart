import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/api_constants.dart';
import '../models/video_model.dart';

class VideoApiService {
  VideoApiService(this.id);
  int id;

  Future<VideoModel> fetchVideo({int page = 1}) async {
    final url = Uri.parse('${ApiConstants.videoBaseUrl}/videos/$id');
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return VideoModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch video: ${response.statusCode}');
    }
  }
}
