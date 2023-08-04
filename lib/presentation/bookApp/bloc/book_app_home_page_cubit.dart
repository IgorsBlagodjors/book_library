import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/presentation/bookApp/bloc/book_app_home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class BookAppHomePageCubit extends Cubit<BookAppHomePageState> {
  final BookRepository _bookRepository;
  final logger = Logger();

  BookAppHomePageCubit(this._bookRepository)
      : super(
          const BookAppHomePageState(
            items: [],
            isLoading: false,
            isError: false,
          ),
        );

  Future<void> loadBooks(String? query) async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _bookRepository.getAllBooksInfo(query);
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
