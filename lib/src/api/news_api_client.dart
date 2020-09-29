import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:nyt_fetch_news/src/models/models.dart';

class NewsApiClient {
  static const baseUrl = 'https://api.nytimes.com';
  final apiKey;

  NewsApiClient({@required this.apiKey}) : assert(apiKey != null);

  Future<List<Story>> getStories(String category) async {
    final url = "$baseUrl/svc/topstories/v2/$category.json?api-key=$apiKey";
    print("Fetching url: $url");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> storiesJson = json.decode(response.body);
      List<dynamic> storiesList = storiesJson['results']
          .map((e) {
            return Story.fromJson(e);
          })
          .cast<Story>()
          .toList();
      return storiesList;
    } else {
      throw Exception("Error while fetching stories...");
    }
  }
}
