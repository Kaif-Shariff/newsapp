import 'package:newsapp/core/network/api_service.dart';
import 'package:newsapp/model/article_model.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository(this.apiService);

  Future<List<ArticleModel>> fetchTopHeadlines() async {
    try {
      final res = await apiService.getTopHeadlines("in", "a1ace81e11144788909208aef9323531", 5);
      if (res.articles.isNotEmpty) {
        return res.articles;
      }
      final fallbackResponse = await apiService.getEverything("news", "a1ace81e11144788909208aef9323531", 1, 5);
      return fallbackResponse.articles;
    } catch (e) {
      throw Exception("Error fetching top headlines");
    }
  }

  Future<List<ArticleModel>> fetchCategoryNews({required String topic}) async {
    try {
      final res = await apiService.getEverything(topic, "a1ace81e11144788909208aef9323531", 5, 2);
      return res.articles;
    } catch (e) {
      throw Exception("Error fetching top headlines");
    }
  }
}
