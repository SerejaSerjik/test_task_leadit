import 'package:flutter/material.dart';
import 'package:nyt_fetch_news/src/cubit/category/category.dart';
import 'package:nyt_fetch_news/src/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelect extends StatefulWidget {
  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryCubit>(
      create: (context) => CategoryCubit(),
      child:
          BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
        if (state is SelectedCategoryState) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose category",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                DropdownButton<Categories>(
                  value: state.selectedCategory, //
                  onChanged: (Categories newCategory) {
                    context
                        .bloc<CategoryCubit>()
                        .changeSelectedCategory(newCategory);
                  },
                  items: Categories.values.map((Categories category) {
                    return DropdownMenuItem<Categories>(
                      value: category,
                      child: Text(
                        category.toShortString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        }
        return null;
      }),
    );
  }
}
