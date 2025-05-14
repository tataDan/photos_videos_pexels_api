import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/api_constants.dart';
import '../models/search_photos_model.dart';

class SearchPhotosApiService {
  SearchPhotosApiService(this.searchText);
  String searchText;

  Future<SearchPhotosModel> fetchPhotos({required int page}) async {
    final url = Uri.parse(
      '${ApiConstants.photoBaseUrl}/search?query=$searchText&page=$page',
    );
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return SearchPhotosModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch photo: ${response.statusCode}');
    }
  }
}
