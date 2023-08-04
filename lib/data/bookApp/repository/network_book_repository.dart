import 'package:book_library/data/bookApp/api/book_api_client.dart';
import 'package:book_library/data/wishlist/api/wish_list_api_client.dart';
import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/domain/items/wishlist.model/wish_list_book_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkBookRepository implements BookRepository {
  final BookApiClient _bookApiClient;
  final WishListApiClient _faveApiClient;
  int _index = 0;

  NetworkBookRepository(this._bookApiClient, this._faveApiClient);

  @override
  Future<List<BookClass>> getAllBooksInfo(String? query) async {
    bool isQueryEmpty = query == null;
    final response = isQueryEmpty
        ? await _bookApiClient.getAllBooksInfo()
        : await _bookApiClient.getAllBooksInfo(query: query);
    return response;
  }

  @override
  Future<BookClass> getOneBookInfo(String id) async {
    final response = await _bookApiClient.getOneCharacterInfo(id);
    return response;
  }

  @override
  Future<void> addBookToWishList(BookClass item) async {
    final faveId = await _faveApiClient.addBookToWishList(item);
    final sharedPrefs = await SharedPreferences.getInstance();
    final faveIds = sharedPrefs.getStringList('fave_ids') ?? [];
    faveIds.add(faveId);
    sharedPrefs.setStringList('fave_ids', faveIds);
  }

  @override
  Future<List<WishListBookClass>> getWishListBooks() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final faveIds = sharedPrefs.getStringList('fave_ids') ?? [];

    final response = await _faveApiClient.getFaveItems(faveIds);
    final characters = response.map((character) =>
        WishListBookClass(
          id: character.data.id,
          name: character.name,
          imageUrl: character.data.imageUrl,
          faveId: character.id,
          date: character.data.date,
          pages: character.data.pageCount,
          rating: character.data.rating,
          authors: character.data.authors,
        ));
    return characters.toList();
  }

  @override
  Future<void> removeFromWishList(String faveId) async {
    await _faveApiClient.removeFromFaves(faveId);
    final sharedPrefs = await SharedPreferences.getInstance();
    final faveIds = sharedPrefs.getStringList('fave_ids') ?? [];
    _index = faveIds.indexOf(faveId);
    faveIds.remove(faveId);
    sharedPrefs.setStringList('fave_ids', faveIds);
  }

  @override
  Future<void> undo(WishListBookClass item) async {
    final faveId = await _faveApiClient.undo(item);
    final sharedPrefs = await SharedPreferences.getInstance();
    final faveIds = sharedPrefs.getStringList('fave_ids') ?? [];
    faveIds.insert(_index, faveId);
    sharedPrefs.setStringList('fave_ids', faveIds);
  }
}