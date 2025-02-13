abstract interface class CategoryEvent {}

class FetchTopHeadlines implements CategoryEvent {}

class FetchCategory implements CategoryEvent {
  final String topic;

  FetchCategory(this.topic);
}
