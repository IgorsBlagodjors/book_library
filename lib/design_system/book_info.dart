import 'package:flutter/cupertino.dart';

class BookInfo {
  final String title;
  final String author;
  final String imageUrl;
  final String grade;
  final String description;
  final String releasedDate;
  final String numberOfPage;
  final String rating;
  final Icon star1;
  final Icon star2;
  final Icon star3;
  final Icon star4;
  final Icon star5;

  BookInfo({
    required this.description,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.grade,
    required this.numberOfPage,
    required this.releasedDate,
    required this.rating,
    required this.star1,
    required this.star2,
    required this.star3,
    required this.star4,
    required this.star5,
  });
}
