import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

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

// Storing dates as a Timestamp object (which contains _seconds and _nanoseconds)
// is the recommended and idiomatic way in Firestore.
// It allows precise timekeeping and native support across all Firebase SDKs.
DateTime dateTimeFromTimestamp(dynamic timestamp) {
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  } else if (timestamp is Map<String, dynamic>) {
    final seconds = timestamp['_seconds'] as int;
    final nanoseconds = timestamp['_nanoseconds'] as int;
    return DateTime.fromMillisecondsSinceEpoch(
      seconds * 1000 + (nanoseconds ~/ 1000000),
    );
  } else if (timestamp is int) {
    // In case it is stored as milliseconds since epoch (not Timestamp)
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  } else {
    talker.error('Invalid timestamp format in ArticleModel: $timestamp');
    throw Exception('Invalid timestamp format: $timestamp');
  }
}

Timestamp dateTimeToTimestamp(DateTime date) => Timestamp.fromDate(date);
