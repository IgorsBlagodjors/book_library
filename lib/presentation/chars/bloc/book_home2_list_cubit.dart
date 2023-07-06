import 'package:book_library/domain/items/model/book_item_class.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/presentation/chars/bloc/book_home2_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookHome2ListCubit extends Cubit<BookHome2ListState> {
  final BookRepository _bookRepository;

  BookHome2ListCubit(this._bookRepository)
      : super(
          const BookHome2ListState(
            items: BookItem(
              id: 'unknown',
              title: 'aa',
              description: 'zz',
              smallThumbnail: 'zz',
              averageRating: 4.2,
              authors: 'zz',
              pageCount: 232,
              publishedDate: '2013',
              ratingsCount: 2,
            ),
            isLoading: false,
            isError: false,
          ),
        );

  Future<void> getOneBook(String passedId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _bookRepository.getOneBookInfo(passedId);
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      // ignore: avoid_print
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> addToWishList(BookItem item) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _bookRepository.addBookToWishList(item);
      emit(state.copyWith(isLoading: false));
    } on Exception catch (ex, stacktrace) {
      // ignore: avoid_print
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
