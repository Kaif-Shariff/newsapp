abstract interface class CategoryEvent {}

class FetchCategoryEvent implements CategoryEvent {
  final String topic;
  final int page;

  FetchCategoryEvent(this.topic, {this.page = 1});
}

class ResetCategoryEvent implements CategoryEvent {}