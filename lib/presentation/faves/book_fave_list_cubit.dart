import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/presentation/faves/book_fave_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookFaveListCubit extends Cubit<BookFaveListState> {
  final BookRepository _favesRepository;

  BookFaveListCubit(this._favesRepository)
      : super(
          const BookFaveListState(
            items: [],
            isLoading: false,
            isError: false,
          ),
        );

  Future<void> loadItem() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _favesRepository.getFaveItems();
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      // ignore: avoid_print
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> removeFromFaves(String faveId) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _favesRepository.removeFromFaves(faveId);
      final items = await _favesRepository.getFaveItems();
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      // ignore: avoid_print
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
