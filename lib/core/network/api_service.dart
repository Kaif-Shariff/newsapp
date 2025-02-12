import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../model/response_model.dart';

part "api_service.g.dart";

@RestApi(baseUrl: "https://newsapi.org/v2")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/top-headlines")
  Future<ResponseModel> getTopHeadlines(
    @Query("country") String country,
    @Query("apiKey") String apiKey,
    @Query("pageSize") int pageSize,
  );

  @GET("/everything")
  Future<ResponseModel> getEverything(
    @Query("q") String q,
    @Query("apiKey") String apiKey,
    @Query("page") int page,
    @Query("pageSize") int pageSize,
  );

  @GET("/top-headlines")
  Future<ResponseModel> getCategoryNews(
    @Query("category") String category,
    @Query("apiKey") String apiKey,
    @Query("page") int page,
    @Query("pageSize") int pageSize,
  );
}
