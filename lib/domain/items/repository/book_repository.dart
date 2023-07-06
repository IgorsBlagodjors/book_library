import 'package:book_library/domain/items/faves.model/fave_book_item.dart';
import 'package:book_library/domain/items/model/book_item_class.dart';

abstract class BookRepository {
  Future<List<BookItem>> getAllBooksInfo();
  Future<List<BookItem>> search(String query);
  Future<BookItem> getOneBookInfo(String id);
  Future<void> addBookToWishList(BookItem item);
  Future<List<FaveBookItem>> getFaveItems();
  Future<void> removeFromFaves(String faveId);
}
