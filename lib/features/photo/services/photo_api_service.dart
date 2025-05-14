import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/api_constants.dart';
import '../models/photo_model.dart';

class PhotoApiService {
  PhotoApiService(this.id);
  int id;

  Future<PhotoModel> fetchPhoto({int page = 1}) async {
    final url = Uri.parse('${ApiConstants.photoBaseUrl}/photos/$id');
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return PhotoModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch photo: ${response.statusCode}');
    }
  }
}
