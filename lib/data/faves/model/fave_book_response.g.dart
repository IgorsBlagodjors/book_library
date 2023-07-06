// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fave_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaveBookResponse _$FaveBookResponseFromJson(Map<String, dynamic> json) =>
    FaveBookResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      data: FaveBookDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

FaveBookDataResponse _$FaveBookDataResponseFromJson(
        Map<String, dynamic> json) =>
    FaveBookDataResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      date: json['date'] as String,
      pageCount: json['pageCount'] as int,
      rating: (json['rating'] as num).toDouble(),
      authors: json['authors'] as String,
    );
