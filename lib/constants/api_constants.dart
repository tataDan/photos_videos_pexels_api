import '../env/env.dart';

class ApiConstants {
  static Map<String, String> get headers => {'Authorization': Env.apiKey};
  static String photoBaseUrl = 'https://api.pexels.com/v1';
  static String videoBaseUrl = 'https://api.pexels.com/videos';
}
