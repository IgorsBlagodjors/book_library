import 'package:book_library/design_system/book_item_class.dart';
import 'package:book_library/design_system/fave_book_item.dart';

abstract class BookRepository {
  Future<List<BookItem>> getAllBooksInfo();
  Future<List<BookItem>> search(String query);
  Future<BookItem> getOneBookInfo(String id);
  Future<void> addBookToWishList(BookItem item);
  Future<List<FaveBookItem>> getFaveItems();
  Future<void> removeFromFaves(String faveId);
}
