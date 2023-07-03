
import 'package:json_annotation/json_annotation.dart';
part 'fave_book_body.g.dart';
@JsonSerializable(createFactory: false, explicitToJson: true)
class FaveBookBody {
  final String name;
  final FaveBookDataBody data;

  FaveBookBody({
    required this.name,
    required this.data,
  });
  Map<String, dynamic> toJson() => _$FaveBookBodyToJson(this);
}
@JsonSerializable(createFactory: false)
class FaveBookDataBody {
  final String id;
  final String name;
  final String imageUrl;
  final String date;
  final int pageCount;
  final double rating;
  final String authors;


  FaveBookDataBody({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.pageCount,
    required this.rating,
    required this.authors,
  });
  Map<String, dynamic> toJson() => _$FaveBookDataBodyToJson(this);
}
