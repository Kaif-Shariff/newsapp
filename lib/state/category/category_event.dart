abstract interface class CategoryEvent {}

class FetchCategory implements CategoryEvent {
  final String topic;
  final int page;

  FetchCategory(this.topic, {this.page = 2});
}
