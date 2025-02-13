import 'package:newsapp/model/article_model.dart';

abstract interface class CategoryState {}

class CategoryInitial implements CategoryState {}

class CategoryLoading implements CategoryState {}

class CategoryLoaded implements CategoryState {
  final List<ArticleModel> articles;
  final int page;
  final bool hasReachedMax;
  final bool isLoadingMore;

  CategoryLoaded(this.articles, this.page, this.hasReachedMax, {this.isLoadingMore = false});

  CategoryLoaded copyWith({
    List<ArticleModel>? articles,
    int? page,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return CategoryLoaded(
      articles ?? this.articles,
      page ?? this.page,
      hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class CategoryError implements CategoryState {
  final String error;
  final int statusCode;

  CategoryError(this.error, this.statusCode);
}
