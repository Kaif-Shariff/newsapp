import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final NewsRepository repository;

  CategoryBloc(this.repository) : super(CategoryInitial()) {
    on<FetchCategoryEvent>(_onFetchCategory);
    on<ResetCategoryEvent>(_onResetCategory);
  }

  Future<void> _onFetchCategory(FetchCategoryEvent event, Emitter<CategoryState> emit) async {
    final currentState = state;

    if (currentState is CategoryLoaded) {
      if (currentState.isLoadingMore || currentState.hasReachedMax) return;
      emit(currentState.copyWith(isLoadingMore: true));
    } else {
      emit(CategoryLoading());
    }

    try {
      final newArticles = await repository.fetchCategoryNews(topic: event.topic, page: event.page);

      final hasReachedMax = newArticles.length < 6;
      final allArticles = currentState is CategoryLoaded ? [...currentState.articles, ...newArticles] : newArticles;

      emit(CategoryLoaded(
        allArticles,
        event.page,
        hasReachedMax,
        isLoadingMore: false,
      ));
    } catch (e) {
      if (currentState is CategoryLoaded) {
        emit(currentState.copyWith(isLoadingMore: false));
      } else {
        emit(CategoryError("Failed to fetch articles", 429));
      }
    }
  }

  void _onResetCategory(ResetCategoryEvent event, Emitter<CategoryState> emit) {
    emit(CategoryInitial()); // Reset the state to initial
  }
}
