import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/domain/items/wishlist.model/wish_list_book_class.dart';

const bookItem = [
  BookClass(
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

class FakeBookRepository implements BookRepository {
  @override
  Future<void> addBookToWishList(BookClass item) {
    // TODO: implement addBookToWishList
    throw UnimplementedError();
  }

  @override
  Future<List<BookClass>> getAllBooksInfo(String? query) async {
    return bookItem;
  }

  @override
  Future<BookClass> getOneBookInfo(String id) {
    // TODO: implement getOneBookInfo
    throw UnimplementedError();
  }

  @override
  Future<List<WishListBookClass>> getWishListBooks() {
    // TODO: implement getWishlistBooks
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromWishList(String faveId) {
    // TODO: implement removeFromFaves
    throw UnimplementedError();
  }

  @override
  Future<void> undo(WishListBookClass removedItem) {
    // TODO: implement undo
    throw UnimplementedError();
  }
}
