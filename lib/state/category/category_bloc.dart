import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final NewsRepository repository;

  CategoryBloc(this.repository) : super(CategoryInitial()) {
    on<FetchTopHeadlines>(_onFetchTopHeadlines);
    on<FetchCategory>(_onFetchCategory);
  }

  Future<void> _onFetchTopHeadlines(FetchTopHeadlines event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final article = await repository.fetchTopHeadlines();
      emit(CategoryLoaded(article));
    } catch (e) {
      emit(
        CategoryError("Failed article setting"),
      );
    }
  }

  Future<void> _onFetchCategory(FetchCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final article = await repository.fetchCategoryNews(topic: event.topic);
      emit(CategoryLoaded(article));
    } catch (e) {
      emit(
        CategoryError("Failed article setting"),
      );
    }
  }
}
