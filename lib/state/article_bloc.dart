import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'package:newsapp/state/article_event.dart';
import 'package:newsapp/state/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final NewsRepository repository;

  ArticleBloc(this.repository) : super(ArticleInitial()) {
    on<FetchTopHeadlines>(_onFetchTopHeadlines);
  }

  Future<void> _onFetchTopHeadlines(FetchTopHeadlines event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    try {
      final article = await repository.fetchTopHeadlines();
      emit(ArticleLoaded(article));
    } catch (e) {
      emit(
        ArticleError("Failed article setting"),
      );
    }
  }
}
