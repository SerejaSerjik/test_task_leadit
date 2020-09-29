import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_fetch_news/src/cubit/category/category.dart';
import 'package:nyt_fetch_news/src/models/models.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit()
      : super(SelectedCategoryState(selectedCategory: Categories.arts));

  Future<void> changeSelectedCategory(Categories category) async {
    emit(SelectedCategoryState(selectedCategory: category));
  }
}
