
import 'package:json_annotation/json_annotation.dart';

part 'wish_list_response.g.dart';

@JsonSerializable(createToJson: false)
class WishListResponse {
  final String id;
  final String name;
  final WishListDataResponse data;

  WishListResponse({
    required this.id,
    required this.name,
    required this.data,
  });

  factory WishListResponse.fromJson(Map<String, dynamic> json) =>
      _$WishListResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class WishListDataResponse {
  final String id;
  final String name;
  final String imageUrl;
  final String date;
  final int pageCount;
  final double rating;
  final String authors;

  WishListDataResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.pageCount,
    required this.rating,
    required this.authors,
  });

  factory WishListDataResponse.fromJson(Map<String, dynamic> json) =>
      _$WishListDataResponseFromJson(json);
}
