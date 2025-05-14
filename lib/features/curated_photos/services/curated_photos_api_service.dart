import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/api_constants.dart';
import '../models/curated_photos_model.dart';

class CuratedPhotosApiService {
  CuratedPhotosApiService();

  Future<CuratedPhotosModel> fetchPhotos({required int page}) async {
    final url = Uri.parse('${ApiConstants.photoBaseUrl}/curated?page=$page');
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CuratedPhotosModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch curated photos: ${response.statusCode}');
    }
  }
}
