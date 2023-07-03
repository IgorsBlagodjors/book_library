import 'package:equatable/equatable.dart';

class FaveBookItem extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String date;
  final String faveId;
  final int pages;
  final double rating;
  final String authors;

  const FaveBookItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.faveId,
    required this.date,
    required this.pages,
    required this.rating,
    required this.authors,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        faveId,
        date,
        pages,
        rating,
        authors,
      ];
}
