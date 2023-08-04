import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_response.g.dart';

@JsonSerializable(createToJson: false)
class BookFullResponse {
  final List<BookDataResponse> items;

  BookFullResponse({
    required this.items,
  });

  List<BookClass> toModel() {
    return items
        .map(
          (bookDataResponse) => BookClass(
            id: bookDataResponse.id,
            title: bookDataResponse.volumeInfo.title ?? 'Unknown',
            description: bookDataResponse.volumeInfo.description ?? 'Unknown',
            smallThumbnail: bookDataResponse
                    .volumeInfo.imageLinks?.smallThumbnail ??
                'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg',
            averageRating: bookDataResponse.volumeInfo.averageRating ?? 0.0,
            publishedDate: bookDataResponse.volumeInfo.publishedDate ?? '0000',
            authors:
                bookDataResponse.volumeInfo.authors?.join(',') ?? 'Unknown',
            pageCount: bookDataResponse.volumeInfo.pageCount ?? 0,
            ratingsCount: bookDataResponse.volumeInfo.ratingsCount ?? 0,
          ),
        )
        .toList();
  }

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

  BookClass toModel(){
    return BookClass(
      id: id,
      title: volumeInfo.title ?? 'Unknown',
      description: volumeInfo.description ?? 'Unknown',
      smallThumbnail: volumeInfo.imageLinks?.smallThumbnail ??
          'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg',
      averageRating: volumeInfo.averageRating ?? 0.0,
      publishedDate: volumeInfo.publishedDate ?? '0000',
      authors: volumeInfo.authors?.join(',') ?? 'Unknown',
      pageCount: volumeInfo.pageCount ?? 0,
      ratingsCount: volumeInfo.ratingsCount ?? 0,
    );
  }

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
