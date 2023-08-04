import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:equatable/equatable.dart';

class BookAppHomePageState extends Equatable {
  final List<BookClass> items;
  final bool isLoading;
  final bool isError;

  const BookAppHomePageState({
    required this.items,
    required this.isLoading,
    required this.isError,
  });

  BookAppHomePageState copyWith({
    List<BookClass>? items,
    bool? isLoading,
    bool? isError,
  }) =>
      BookAppHomePageState(
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
