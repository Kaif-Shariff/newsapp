abstract interface class CategoryEvent {}

class FetchCategoryEvent implements CategoryEvent {
  final String topic;
  final int pageSize;

  FetchCategoryEvent(this.topic, this.pageSize);
}

class ResetCategoryEvent implements CategoryEvent {}