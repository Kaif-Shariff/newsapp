import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'package:newsapp/state/article/article_state.dart';

import 'article_event.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final NewsRepository repository;

  ArticleBloc(this.repository) : super(ArticleInitial()) {
    on<FetchTopHeadlines>(_onFetchTopHeadlines);
    on<FetchCategory>(_onFetchCategory);
  }

  Future<void> _onFetchTopHeadlines(FetchTopHeadlines event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    try {
      final article = await repository.fetchTopHeadlines(event.pageSize);
      emit(ArticleLoaded(article));
    } catch (e) {
      emit(
        ArticleError("Failed getting top-headlines article", 429),
      );
    }
  }

  Future<void> _onFetchCategory(FetchCategory event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    try {
      final article = await repository.fetchCategoryNews(topic: event.topic, page: 10);
      emit(ArticleLoaded(article));
    } catch (e) {
      emit(
        ArticleError("Failed getting everything article", 429),
      );
    }
  }
}
