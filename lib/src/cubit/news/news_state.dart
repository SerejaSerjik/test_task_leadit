import 'package:meta/meta.dart';
import 'package:nyt_fetch_news/src/models/models.dart';

abstract class NewsState {}

class NewsEmptyState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  List<Story> loadedStories;

  NewsLoadedState({@required this.loadedStories})
      : assert(loadedStories != null);
}

class NewsErrorState extends NewsState {}
