import 'dart:ffi';

import 'package:book_library/design_system/book_api_client.dart';
import 'package:book_library/design_system/book_item_class.dart';
import 'package:book_library/design_system/book_repository.dart';

class NetworkBookRepository implements BookRepository {
  final BookApiClient _bookApiClient;

  NetworkBookRepository(this._bookApiClient);

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
}
