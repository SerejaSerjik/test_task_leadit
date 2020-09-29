import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_fetch_news/src/api/api_keys.dart';
import 'package:nyt_fetch_news/src/api/news_api_client.dart';
import 'package:nyt_fetch_news/src/cubit/category/category.dart';
import 'package:nyt_fetch_news/src/cubit/news/news.dart';
import 'package:nyt_fetch_news/src/models/models.dart';
import 'package:nyt_fetch_news/src/services/news_repository.dart';
import 'package:nyt_fetch_news/src/widgets/category_select.dart';
import 'package:nyt_fetch_news/src/widgets/news_list.dart';

class HomePage extends StatelessWidget {
  final newsRepository = NewsRepository(
      newsApiClient: NewsApiClient(apiKey: ApiKey.NEW_YORK_TIMES));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(newsRepository: newsRepository),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
      ],
      child:
          BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "The New York Times",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
                child: Container(
                  color: Colors.black,
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(1.0)),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CategorySelect(),
              Expanded(child: NewsList()),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.cloud_download),
            backgroundColor: Colors.black,
            onPressed: () {
              if (state is SelectedCategoryState) {
                context.bloc<NewsCubit>().fetchStories(state.selectedCategory);
              } else {
                context.bloc<NewsCubit>().fetchStories(Categories.world);
              }
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      }),
    );
  }
}
