import 'package:book_library/design_system/book_info.dart';

abstract class BooksRepository {
  Future<List<BookInfo>> getBook();
  Future<List<BookInfo>> search(String query);
}
