import 'package:json_annotation/json_annotation.dart';

part 'SearchResult.g.dart';

class SearchResult {
  final List<SearchResultItem> items;

  const SearchResult({this.items});

  static SearchResult fromJson(List<dynamic> list) {
    final items = list.map((dynamic item) =>
        SearchResultItem.fromJson(item as Map<String, dynamic>))
      .toList();
    return SearchResult(items: items);
  }
}

@JsonSerializable()
class SearchResultItem {
  final String type;
  final String title;
  final String videoId;
  // final String videoThumbnailUrl; // list
  final String publishedText;
  final int viewCount;
  final int lengthSeconds;

  SearchResultItem({
    this.type,
    this.title,
    this.videoId,
    this.publishedText,
    this.viewCount,
    this.lengthSeconds,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) => _$SearchResultItemFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultItemToJson(this);
}

@JsonSerializable()
class SearchResultError {
  String error;

  SearchResultError({this.error});

  factory SearchResultError.fromJson(Map<String, dynamic> json) => _$SearchResultErrorFromJson(json);
}
