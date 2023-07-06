import 'package:book_library/data/items/api/book_api_client.dart';
import 'package:book_library/data/faves/api/fave_api_client.dart';
import 'package:book_library/domain/items/faves.model/fave_book_item.dart';
import 'package:book_library/domain/items/model/book_item_class.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkBookRepository implements BookRepository {
  final BookApiClient _bookApiClient;
  final FaveApiClient _faveApiClient;

  NetworkBookRepository(this._bookApiClient, this._faveApiClient);

  @override
  Future<List<BookItem>> getAllBooksInfo() async {
    final response = await _bookApiClient.getAllBooksInfo();
    final characters = response.map(
      (character) => BookItem(
        id: character.id,
        title: character.volumeInfo.title ?? 'Unknown',
        description: character.volumeInfo.description ?? 'Unknown',
        smallThumbnail: character.volumeInfo.imageLinks?.smallThumbnail ??
            'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg',
        averageRating: character.volumeInfo.averageRating ?? 0.0,
        publishedDate: character.volumeInfo.publishedDate ?? '0000',
        authors: character.volumeInfo.authors?.join(',') ?? 'Unknown',
        pageCount: character.volumeInfo.pageCount ?? 0,
        ratingsCount: character.volumeInfo.ratingsCount ?? 0,
      ),
    );
    return characters.toList();
  }

  @override
  Future<List<BookItem>> search(String query) async {
    final response = await _bookApiClient.search(query);
    final characters = response.map(
      (character) => BookItem(
        id: character.id,
        title: character.volumeInfo.title ?? 'Unknown',
        description: character.volumeInfo.description ?? 'Unknown',
        smallThumbnail: character.volumeInfo.imageLinks?.smallThumbnail ??
            'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg',
        averageRating: character.volumeInfo.averageRating ?? 0.0,
        publishedDate: character.volumeInfo.publishedDate ?? '0000',
        authors: character.volumeInfo.authors?.join(',') ?? 'Unknown',
        pageCount: character.volumeInfo.pageCount ?? 0,
        ratingsCount: character.volumeInfo.ratingsCount ?? 0,
      ),
    );
    return characters.toList();
  }

  @override
  Future<BookItem> getOneBookInfo(String id) async {
    final response = await _bookApiClient.getOneCharacterInfo(id);
    final characters = BookItem(
      id: response.id,
      title: response.volumeInfo.title ?? 'Unknown',
      description: response.volumeInfo.description ?? 'Unknown',
      smallThumbnail: response.volumeInfo.imageLinks?.smallThumbnail ??
          'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg',
      averageRating: response.volumeInfo.averageRating ?? 0.0,
      publishedDate: response.volumeInfo.publishedDate ?? '0000',
      authors: response.volumeInfo.authors?.join(',') ?? 'Unknown',
      pageCount: response.volumeInfo.pageCount ?? 0,
      ratingsCount: response.volumeInfo.ratingsCount ?? 0,
    );
    return characters;
  }

  @override
  Future<void> addBookToWishList(BookItem item) async {
    final faveId = await _faveApiClient.addBookToWishList(item);
    final sharedPrefs = await SharedPreferences.getInstance();
    final faveIds = sharedPrefs.getStringList('fave_ids') ?? [];
    faveIds.add(faveId);
    sharedPrefs.setStringList('fave_ids', faveIds);
  }

  @override
  Future<List<FaveBookItem>> getFaveItems() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final faveIds = sharedPrefs.getStringList('fave_ids') ?? [];

    final response = await _faveApiClient.getFaveItems(faveIds);
    final characters = response.map((character) => FaveBookItem(
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
  Future<void> removeFromFaves(String faveId) async {
    await _faveApiClient.removeFromFaves(faveId);
    final sharedPrefs = await SharedPreferences.getInstance();
    final faveIds = sharedPrefs.getStringList('fave_ids') ?? [];
    faveIds.remove(faveId);
    sharedPrefs.setStringList('fave_ids', faveIds);
  }
}
