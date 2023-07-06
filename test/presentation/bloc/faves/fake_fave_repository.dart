import 'package:book_library/domain/items/faves.model/fave_book_item.dart';
import 'package:book_library/domain/items/model/book_item_class.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';

const faveItem = [
  FaveBookItem(
    id: '1',
    name: 'Unknown',
    imageUrl: 'zzz',
    faveId: 'ff23',
    date: '2011',
    pages: 235,
    rating: 4.1,
    authors: 'Unknown',
  ),
  FaveBookItem(
    id: '2',
    name: 'Unknown2',
    imageUrl: 'ggg',
    faveId: 'ert2',
    date: '2011',
    pages: 235,
    rating: 4.1,
    authors: 'Unknown',
  ),
];

class FakeFaveRepository extends BookRepository {
  @override
  Future<void> addBookToWishList(BookItem item) {
    // TODO: implement addBookToWishList
    throw UnimplementedError();
  }

  @override
  Future<List<BookItem>> getAllBooksInfo() {
    // TODO: implement getAllBooksInfo
    throw UnimplementedError();
  }

  @override
  Future<List<FaveBookItem>> getFaveItems() async {
    return faveItem;
  }

  @override
  Future<BookItem> getOneBookInfo(String id) {
    // TODO: implement getOneBookInfo
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromFaves(String faveId) {
    // TODO: implement getOneBookInfo
    throw UnimplementedError();
  }

  @override
  Future<List<BookItem>> search(String query) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
