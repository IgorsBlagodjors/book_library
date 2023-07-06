import 'package:json_annotation/json_annotation.dart';
part 'fave_book_response.g.dart';

@JsonSerializable(createToJson: false)
class FaveBookResponse {
  final String id;
  final String name;
  final FaveBookDataResponse data;

  FaveBookResponse({
    required this.id,
    required this.name,
    required this.data,
  });

  factory FaveBookResponse.fromJson(Map<String, dynamic> json) =>
      _$FaveBookResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class FaveBookDataResponse {
  final String id;
  final String name;
  final String imageUrl;
  final String date;
  final int pageCount;
  final double rating;
  final String authors;

  FaveBookDataResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.pageCount,
    required this.rating,
    required this.authors,
  });

  factory FaveBookDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FaveBookDataResponseFromJson(json);
}
