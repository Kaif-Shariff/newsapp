import 'package:json_annotation/json_annotation.dart';
import 'package:newsapp/model/source_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
