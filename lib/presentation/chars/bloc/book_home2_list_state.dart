import 'package:book_library/domain/items/model/book_item_class.dart';
import 'package:equatable/equatable.dart';

class BookHome2ListState extends Equatable {
  final BookItem? items;
  final bool isLoading;
  final bool isError;

  const BookHome2ListState({
    required this.items,
    required this.isLoading,
    required this.isError,
  });

  BookHome2ListState copyWith({
    BookItem? items,
    bool? isLoading,
    bool? isError,
  }) =>
      BookHome2ListState(
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
