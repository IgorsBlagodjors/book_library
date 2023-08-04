import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:equatable/equatable.dart';

class BookAppDetailsPageState extends Equatable {
  final BookClass? items;
  final bool isLoading;
  final bool isError;

  const BookAppDetailsPageState({
    required this.items,
    required this.isLoading,
    required this.isError,
  });

  BookAppDetailsPageState copyWith({
    BookClass? items,
    bool? isLoading,
    bool? isError,
  }) =>
      BookAppDetailsPageState(
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
