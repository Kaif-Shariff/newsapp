import 'package:newsapp/model/article_model.dart';

abstract interface class CategoryState {}

class CategoryInitial implements CategoryState {}

class CategoryLoading implements CategoryState {}

class CategoryLoaded implements CategoryState {
  final List<ArticleModel> articles;
  final int page;
  final bool hasReachedMax;

  CategoryLoaded(this.articles, this.page, this.hasReachedMax);
}

class CategoryError implements CategoryState {
  final String error;

  CategoryError(this.error);
}
