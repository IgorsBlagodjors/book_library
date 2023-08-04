import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/domain/items/wishlist.model/wish_list_book_class.dart';
import 'package:book_library/presentation/wishlist/bloc/book_wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class BookWishListCubit extends Cubit<BookWishListState> {
  final BookRepository _favesRepository;
  final logger = Logger();

  BookWishListCubit(this._favesRepository)
      : super(
          const BookWishListState(
            items: [],
            isLoading: false,
            isError: false,
          ),
        );

  Future<void> loadWishlist() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _favesRepository.getWishListBooks();
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> removeFromWishlist(String faveId) async {
    try {
      await _favesRepository.removeFromWishList(faveId);
      final items = await _favesRepository.getWishListBooks();
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> undo(WishListBookClass faveId) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _favesRepository.undo(faveId);
      final items = await _favesRepository.getWishListBooks();
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      logger.e('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
