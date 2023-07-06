import 'package:book_library/domain/items/faves.model/fave_book_item.dart';
import 'package:equatable/equatable.dart';

class BookFaveListState extends Equatable {
  final List<FaveBookItem> items;
  final bool isLoading;
  final bool isError;

  const BookFaveListState({
    required this.items,
    required this.isLoading,
    required this.isError,
  });

  BookFaveListState copyWith({
    List<FaveBookItem>? items,
    bool? isLoading,
    bool? isError,
  }) =>
      BookFaveListState(
        items: items ?? this.items,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
      );

  @override
  List<Object?> get props => [
        items,
        isLoading,
        isError,
      ];
}
