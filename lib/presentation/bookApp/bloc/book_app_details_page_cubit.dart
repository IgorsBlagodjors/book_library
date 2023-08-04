import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'book_app_details_page_state.dart';

class BookAppDetailsPageCubit extends Cubit<BookAppDetailsPageState> {
  final BookRepository _bookRepository;
  final logger = Logger();

  BookAppDetailsPageCubit(this._bookRepository)
      : super(
          const BookAppDetailsPageState(
            items: BookClass(
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
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> addToWishList(BookClass item) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _bookRepository.addBookToWishList(item);
      emit(state.copyWith(isLoading: false));
    } on Exception catch (ex, stacktrace) {
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
