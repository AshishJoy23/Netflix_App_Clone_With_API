import 'package:netflix_app_clone/core/strings.dart';
import 'package:netflix_app_clone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}