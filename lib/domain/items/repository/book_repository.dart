import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:book_library/domain/items/wishlist.model/wish_list_book_class.dart';

abstract class BookRepository {
  Future<List<BookClass>> getAllBooksInfo(String? query);
  Future<BookClass> getOneBookInfo(String id);
  Future<void> addBookToWishList(BookClass item);
  Future<List<WishListBookClass>> getWishListBooks();
  Future<void> removeFromWishList(String faveId);
  Future<void> undo(WishListBookClass removedItem);
}
