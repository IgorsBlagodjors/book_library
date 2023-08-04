
import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/domain/items/wishlist.model/wish_list_book_class.dart';

const faveItem = [
  WishListBookClass(
    id: '1',
    name: 'Unknown',
    imageUrl: 'zzz',
    faveId: 'ff23',
    date: '2011',
    pages: 235,
    rating: 4.1,
    authors: 'Unknown',
  ),
  WishListBookClass(
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

class FakeWishListRepository extends BookRepository {


  @override
  Future<void> removeFromWishList(String faveId) {
    // TODO: implement getOneBookInfo
    throw UnimplementedError();
  }


  @override
  Future<void> addBookToWishList(BookClass item) {
    // TODO: implement addBookToWishList
    throw UnimplementedError();
  }


  @override
  Future<BookClass> getOneBookInfo(String id) {
    // TODO: implement getOneBookInfo
    throw UnimplementedError();
  }

  @override
  Future<List<WishListBookClass>> getWishListBooks() async{
    return faveItem;
  }

  @override
  Future<List<BookClass>> getAllBooksInfo(String? query) {
    // TODO: implement getAllBooksInfo
    throw UnimplementedError();
  }

  @override
  Future<void> undo(WishListBookClass removedItem) {
    // TODO: implement undo
    throw UnimplementedError();
  }
}
