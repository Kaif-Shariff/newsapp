import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final NewsRepository repository;

  CategoryBloc(this.repository) : super(CategoryInitial()) {
    on<FetchCategory>(_onFetchCategory);
  }

  Future<void> _onFetchCategory(FetchCategory event, Emitter<CategoryState> emit) async {
    // if (event.page == 1) {
    //   emit(CategoryLoading());
    //   try {
    //     final data = await repository.fetchCategoryNews(topic: event.topic, page: 1);
    //     emit(CategoryLoaded(data, 1, data.length < 6));
    //   } catch (e) {
    //     emit(CategoryError("Failed article setting"));
    //   }
    // } else if (state is CategoryLoaded) {
    //   final currentState = state as CategoryLoaded;
    //   try {
    //     final data = await repository.fetchCategoryNews(topic: event.topic, page: event.page);
    //     emit(data.isEmpty
    //         ? currentState.hasReachedMax
    //         : CategoryLoaded(
    //             data,
    //             event.page,
    //             data.length < 6,
    //           ));
    //   } catch (e) {
    //     emit(CategoryError("Error loading category news"));
    //   }
    // }

    emit(CategoryLoading());
    try {
      final article = await repository.fetchCategoryNews(topic: event.topic, page: event.page);
      emit(CategoryLoaded(article, event.page, article.length < 6));
    } catch (e) {
      emit(
        CategoryError("Failed article setting"),
      );
    }
  }
}
