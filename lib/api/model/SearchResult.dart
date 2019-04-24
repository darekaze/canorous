import 'package:json_annotation/json_annotation.dart';

part 'SearchResult.g.dart';

class SearchResult {
  final List<SearchResultItem> items;

  const SearchResult({this.items});

  static SearchResult fromJson(List<dynamic> list) {
    final items = list
        .map((dynamic item) =>
            SearchResultItem.fromJson(item as Map<String, dynamic>))
        .where((SearchResultItem item) =>
            !(item.liveNow || item.paid || item.premium))
        .toList();
    return SearchResult(items: items);
  }
}

@JsonSerializable()
class SearchResultItem {
  final String type;
  final String title;
  final String videoId;
  final String publishedText;
  final int viewCount;
  final int published;
  final int lengthSeconds;
  final bool liveNow;
  final bool paid;
  final bool premium;

  SearchResultItem({
    this.type,
    this.title,
    this.videoId,
    this.publishedText,
    this.viewCount,
    this.published,
    this.lengthSeconds,
    this.liveNow,
    this.paid,
    this.premium,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultItemToJson(this);
}

@JsonSerializable()
class SearchResultError {
  String error;

  SearchResultError({this.error});

  factory SearchResultError.fromJson(Map<String, dynamic> json) =>
      _$SearchResultErrorFromJson(json);
}
