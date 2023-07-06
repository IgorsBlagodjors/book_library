import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/presentation/chars/bloc/book_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListCubit extends Cubit<BookListState> {
  final BookRepository _bookRepository;

  BookListCubit(this._bookRepository)
      : super(
          const BookListState(
            items: [],
            isLoading: false,
            isError: false,
          ),
        );

  Future<void> loadItems() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _bookRepository.getAllBooksInfo();
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      // ignore: avoid_print
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> search(String query) async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _bookRepository.search(query);
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      // ignore: avoid_print
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
