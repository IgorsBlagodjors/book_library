import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BookCharacter extends Equatable {
  final String id;
  final String title;
  final String description;
  final String smallThumbnail;
  final double averageRating;
  final String publishedDate;
  final String authors;

  const BookCharacter({
    required this.id,
    required this.title,
    required this.description,
    required this.smallThumbnail,
    required this.averageRating,
    required this.publishedDate,
    required this.authors,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        smallThumbnail,
        averageRating,
        publishedDate,
        authors,
      ];
}
