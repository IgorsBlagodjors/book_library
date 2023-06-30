import 'package:book_library/design_system/book_item_class.dart';

abstract class BookRepository {
  Future<List<BookItem>> getAllBooksInfo();
  Future<List<BookItem>> search(String query);
  Future<BookItem> getOneBookInfo(String id);
}
