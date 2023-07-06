// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookFullResponse _$BookFullResponseFromJson(Map<String, dynamic> json) =>
    BookFullResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => BookDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

BookDataResponse _$BookDataResponseFromJson(Map<String, dynamic> json) =>
    BookDataResponse(
      id: json['id'] as String,
      volumeInfo:
          VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
      title: json['title'] as String?,
      description: json['description'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publishedDate: json['publishedDate'] as String?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      pageCount: json['pageCount'] as int?,
      ratingsCount: json['ratingsCount'] as int?,
    );

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) => ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );
