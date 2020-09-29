import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_fetch_news/src/cubit/news/news_state.dart';
import 'package:nyt_fetch_news/src/models/models.dart';
import 'package:nyt_fetch_news/src/services/news_repository.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;

  NewsCubit({this.newsRepository})
      : assert(newsRepository != null),
        super(NewsEmptyState());

  Future<void> fetchStories(Categories category) async {
    try {
      emit(NewsLoadingState());
      final List<Story> _loadedStories =
          await newsRepository.getStories(category.toShortString());
      emit(NewsLoadedState(loadedStories: _loadedStories));
    } catch (e) {
      print(e);
      emit(NewsErrorState());
      Timer(Duration(seconds: 2), () => emit(NewsEmptyState()));
    }
  }
}
