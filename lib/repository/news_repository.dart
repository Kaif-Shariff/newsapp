import 'package:newsapp/core/network/api_service.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/utils/constants.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository(this.apiService);

  Future<List<ArticleModel>> fetchTopHeadlines(int pageSize) async {
    try {
      final res = await apiService.getTopHeadlines("in", apiKey, pageSize);
      if (res.articles.isNotEmpty) {
        return res.articles;
      }
      final fallbackResponse = await apiService.getEverything("news", apiKey, 1, pageSize);
      return fallbackResponse.articles;
    } catch (e) {
      throw Exception("Error fetching top headlines");
    }
  }

  Future<List<ArticleModel>> fetchCategoryNews({required String topic, required int page}) async {
    try {
      final res = await apiService.getEverything(topic, apiKey, 5, page);
      return res.articles;
    } catch (e) {
      throw Exception("Error fetching top headlines");
    }
  }
}
