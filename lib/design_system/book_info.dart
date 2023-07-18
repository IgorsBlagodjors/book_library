import 'package:flutter/cupertino.dart';

class BookInfo {
  final String title;
  final String author;
  final String imageUrl;
  final String grade;
  final String description;
  final String releasedDate;
  final String numberOfPage;
  final String ratingDetailsPage;
  final int rating;

  BookInfo({
    required this.description,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.grade,
    required this.numberOfPage,
    required this.releasedDate,
    required this.ratingDetailsPage,
    required this.rating,
  });
}
