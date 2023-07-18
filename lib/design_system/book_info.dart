import 'package:flutter/cupertino.dart';

class BookInfo {
  final String title;
  final String description;
  final String imageUrl;
  final String grade;
  final int rating;

  BookInfo({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.grade,
    required this.rating,
  });
}
