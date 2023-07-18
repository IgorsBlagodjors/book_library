import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class BookInfo extends Equatable {
  final String title;
  final String author;
  final String assetImage;
  final String grade;
  final String description;
  final String releasedDate;
  final String numberOfPage;
  final String averageRating;
  final int rating;

  const BookInfo({
    required this.description,
    required this.title,
    required this.author,
    required this.assetImage,
    required this.grade,
    required this.numberOfPage,
    required this.releasedDate,
    required this.averageRating,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        description,
        title,
        author,
        assetImage,
        grade,
        numberOfPage,
        releasedDate,
        averageRating,
        rating,
      ];
}
