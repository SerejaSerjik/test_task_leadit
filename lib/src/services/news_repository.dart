import 'package:flutter/cupertino.dart';
import 'package:nyt_fetch_news/src/api/api_keys.dart';
import 'package:nyt_fetch_news/src/api/news_api_client.dart';
import 'package:nyt_fetch_news/src/models/models.dart';

class NewsRepository {
  NewsApiClient newsApiClient;

  NewsRepository({@required this.newsApiClient})
      : assert(newsApiClient != null);

  Future<List<Story>> getStories(String category) {
    return newsApiClient.getStories(category);
  }
}
