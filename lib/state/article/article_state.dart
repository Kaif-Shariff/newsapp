import 'package:newsapp/model/article_model.dart';

abstract interface class ArticleState {}

class ArticleInitial implements ArticleState {}

class ArticleLoading implements ArticleState {}

class ArticleLoaded implements ArticleState {
  final List<ArticleModel> articles;

  ArticleLoaded(this.articles);
}

class ArticleError implements ArticleState {
  final String error;

  ArticleError(this.error);
}
