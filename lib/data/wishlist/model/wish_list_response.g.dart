// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListResponse _$WishListResponseFromJson(Map<String, dynamic> json) =>
    WishListResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      data: WishListDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

WishListDataResponse _$WishListDataResponseFromJson(
        Map<String, dynamic> json) =>
    WishListDataResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      date: json['date'] as String,
      pageCount: json['pageCount'] as int,
      rating: (json['rating'] as num).toDouble(),
      authors: json['authors'] as String,
    );
