import 'package:json_annotation/json_annotation.dart';
part 'wish_list_body.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class WishListBody {
  final String name;
  final WishListDataBody data;

  WishListBody({
    required this.name,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$WishListBodyToJson(this);
}

@JsonSerializable(createFactory: false)
class WishListDataBody {
  final String id;
  final String name;
  final String imageUrl;
  final String date;
  final int pageCount;
  final double rating;
  final String authors;

  WishListDataBody({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.pageCount,
    required this.rating,
    required this.authors,
  });

  Map<String, dynamic> toJson() => _$WishListDataBodyToJson(this);
}
