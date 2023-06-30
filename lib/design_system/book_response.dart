import 'package:json_annotation/json_annotation.dart';

part 'book_response.g.dart';

@JsonSerializable(createToJson: false)
class BookFullResponse {
  final List<BookDataResponse> items;

  BookFullResponse({
    required this.items,
  });

  factory BookFullResponse.fromJson(Map<String, dynamic> json) =>
      _$BookFullResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class BookDataResponse {
  final String id;
  final VolumeInfo volumeInfo;

  BookDataResponse({
    required this.id,
    required this.volumeInfo,
  });

  factory BookDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BookDataResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class VolumeInfo {
  final String? title;
  final String? description;
  final List<String>? authors;
  final String? publishedDate;
  final double? averageRating;
  final int? pageCount;
  final int? ratingsCount;
  final ImageLinks? imageLinks;

  VolumeInfo({
    required this.title,
    required this.description,
    required this.authors,
    required this.publishedDate,
    required this.averageRating,
    required this.imageLinks,
    required this.pageCount,
    required this.ratingsCount,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
}
