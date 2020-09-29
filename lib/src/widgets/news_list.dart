import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_fetch_news/src/cubit/news/news.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsEmptyState) {
          return Center(
            child: Text("No news recieved. Press action button to load news."),
          );
        }

        if (state is NewsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          );
        }

        if (state is NewsLoadedState) {
          return ListView.builder(
              itemCount: state.loadedStories.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(state.loadedStories[index].title),
                  children: [
                    Image.network(state.loadedStories[index].multimedia[0].url),
                  ],
                );
              });
        }

        if (state is NewsErrorState) {
          return Center(
            child: Text(
              "Error while loading news...",
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        return Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ));
      },
    );
  }
}
