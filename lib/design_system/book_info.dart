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
  final String rating;
  final Icon star1;
  final Icon star2;
  final Icon star3;
  final Icon star4;
  final Icon star5;

  const BookInfo({
    required this.description,
    required this.title,
    required this.author,
    required this.assetImage,
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

  @override
  List<Object?> get props => [
        description,
        title,
        author,
        assetImage,
        grade,
        numberOfPage,
        releasedDate,
        rating,
        star1,
        star2,
        star3,
        star4,
        star5,
      ];
}
