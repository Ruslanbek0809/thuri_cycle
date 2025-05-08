import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide.freezed.dart';
part 'guide.g.dart';

@freezed
class Guide with _$Guide {
  const factory Guide({
    required String uid,
    required String material,
    @JsonKey(name: 'material_de')
    required String materialDe,
    required String imageUrl,
    required String iconUrl,
    required String color,
    required String content,
    @JsonKey(name: 'content_de')
    required String contentDe,
    required String tip,
    @JsonKey(name: 'tip_de')
    required String tipDe,
  }) = _Guide;
  const Guide._();

  factory Guide.fromJson(Map<String, Object?> json) => _$GuideFromJson(json);
}
