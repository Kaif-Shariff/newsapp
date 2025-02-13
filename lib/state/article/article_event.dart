abstract interface class ArticleEvent {}

class FetchTopHeadlines implements ArticleEvent {
  final int pageSize;

  FetchTopHeadlines(this.pageSize);
}

class FetchCategory implements ArticleEvent {
  final String topic;
  final int pageSize;

  FetchCategory(this.topic, this.pageSize);
}
