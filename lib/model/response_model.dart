import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  const ResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
