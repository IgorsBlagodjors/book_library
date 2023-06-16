import 'package:flutter/cupertino.dart';

class BookInfo {
  final String title;
  final String description;
  final String imageUrl;
  final String grade;
  final Icon star1;
  final Icon star2;
  final Icon star3;
  final Icon star4;
  final Icon star5;

  BookInfo({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.grade,
    required this.star1,
    required this.star2,
    required this.star3,
    required this.star4,
    required this.star5,
  });
}
