import 'package:book_library/domain/items/faves.model/fave_book_item.dart';
import 'package:book_library/domain/items/model/book_item_class.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';

const bookItem = BookItem(
  id: '1',
  title: 'Eagles feather',
  description: 'description',
  smallThumbnail: 'zzz',
  averageRating: 3.1,
  publishedDate: '2014',
  authors: 'Unknown',
  pageCount: 124,
  ratingsCount: 4,
);

class FakeBookRepository implements BookRepository {
  @override
  Future<void> addBookToWishList(BookItem item) {
    // TODO: implement addBookToWishList
    throw UnimplementedError();
  }

  @override
  Future<List<BookItem>> getAllBooksInfo() async {
    return [
      const BookItem(
        id: '1',
        title: 'Eagles feather',
        description: 'description',
        smallThumbnail: 'zzz',
        averageRating: 3.1,
        publishedDate: '2014',
        authors: 'Unknown',
        pageCount: 124,
        ratingsCount: 4,
      ),
    ];
  }

  @override
  Future<List<FaveBookItem>> getFaveItems() {
    // TODO: implement getFaveItems
    throw UnimplementedError();
  }

  @override
  Future<BookItem> getOneBookInfo(String id) {
    // TODO: implement getOneBookInfo
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromFaves(String faveId) {
    // TODO: implement removeFromFaves
    throw UnimplementedError();
  }

  @override
  Future<List<BookItem>> search(String query) async {
    return [
      const BookItem(
        id: '14',
        title: 'Witcher',
        description: 'description',
        smallThumbnail: 'yyyz',
        averageRating: 4.5,
        publishedDate: '2020',
        authors: 'Unknown',
        pageCount: 200,
        ratingsCount: 10,
      ),
    ];
  }
}
