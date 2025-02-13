abstract interface class ArticleEvent {}

class FetchTopHeadlines implements ArticleEvent {}

class FetchCategory implements ArticleEvent {
  final String topic;

  FetchCategory(this.topic);
}
