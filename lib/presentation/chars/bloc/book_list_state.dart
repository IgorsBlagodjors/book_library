import 'package:book_library/domain/items/model/book_item_class.dart';
import 'package:equatable/equatable.dart';

class BookListState extends Equatable {
  final List<BookItem> items;
  final bool isLoading;
  final bool isError;

  const BookListState({
    required this.items,
    required this.isLoading,
    required this.isError,
  });

  BookListState copyWith({
    List<BookItem>? items,
    bool? isLoading,
    bool? isError,
  }) =>
      BookListState(
          items: items ?? this.items,
          isLoading: isLoading ?? this.isLoading,
          isError: isError ?? this.isError);

  @override
  List<Object?> get props => [
        items,
        isLoading,
        isError,
      ];
}
