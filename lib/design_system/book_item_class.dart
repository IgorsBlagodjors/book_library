import 'package:equatable/equatable.dart';

class BookItem extends Equatable {
  final String id;
  final String title;
  final String description;
  final String smallThumbnail;
  final double averageRating;
  final String publishedDate;
  final String authors;
  final int pageCount;
  final int ratingsCount;

  const BookItem({
    required this.id,
    required this.title,
    required this.description,
    required this.smallThumbnail,
    required this.averageRating,
    required this.publishedDate,
    required this.authors,
    required this.pageCount,
    required this.ratingsCount,
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
        pageCount,
        ratingsCount,
      ];
}
