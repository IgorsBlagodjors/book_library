
import 'package:book_library/domain/items/wishlist.model/wish_list_book_class.dart';
import 'package:equatable/equatable.dart';

class BookWishListState extends Equatable {
  final List<WishListBookClass> items;
  final bool isLoading;
  final bool isError;

  const BookWishListState({
    required this.items,
    required this.isLoading,
    required this.isError,
  });

  BookWishListState copyWith({
    List<WishListBookClass>? items,
    bool? isLoading,
    bool? isError,
  }) =>
      BookWishListState(
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
