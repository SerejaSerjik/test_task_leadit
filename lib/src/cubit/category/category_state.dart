import 'package:meta/meta.dart';
import 'package:nyt_fetch_news/src/models/models.dart';

abstract class CategoryState {}

class SelectedCategoryState extends CategoryState {
  Categories selectedCategory;

  SelectedCategoryState({@required this.selectedCategory})
      : assert(selectedCategory != null);
}
