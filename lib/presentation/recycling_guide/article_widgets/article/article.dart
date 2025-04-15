import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String uid,
    required String title,
    required String summary,
    required String imageUrl,
    required String tag,
    required String content,
    @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeToTimestamp)
    required DateTime date,
    @Default(false) bool? featured,
  }) = _Article;
  const Article._();

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);
}

DateTime dateTimeFromTimestamp(dynamic timestamp) => timestamp is Timestamp
    ? timestamp.toDate()
    : DateTime.fromMillisecondsSinceEpoch(timestamp as int);

Timestamp dateTimeToTimestamp(DateTime date) => Timestamp.fromDate(date);
