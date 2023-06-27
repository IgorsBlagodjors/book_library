import 'dart:ffi';

import 'package:book_library/design_system/book_api_client.dart';
import 'package:book_library/design_system/book_character.dart';
import 'package:book_library/design_system/book_repository.dart';

class NetworkBookRepository implements BookRepository {
  final BookApiClient _bookApiClient;

  NetworkBookRepository(this._bookApiClient);

  @override
  Future<List<BookCharacter>> getAllCharacters() async {
    final response = await _bookApiClient.getAllCharacters();
    final characters = response.map(
      (character) => BookCharacter(
          id: character.id,
          title: character.volumeInfo.title ?? 'Unknown',
          description: character.volumeInfo.description ?? 'Unknown',
          smallThumbnail: character.volumeInfo.imageLinks?.smallThumbnail ??
              'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg',
          averageRating: character.volumeInfo.averageRating ?? 0.0,
          publishedDate: character.volumeInfo.publishedDate ?? '0000',
          authors: character.volumeInfo.title ?? 'Unknown'),
    );
    return characters.toList();
  }

  @override
  Future<List<BookCharacter>> search(String query) async {
    final response = await _bookApiClient.search(query);
    final characters = response.map(
      (character) => BookCharacter(
        id: character.id,
        title: character.volumeInfo.title ?? 'Unknown',
        description: character.volumeInfo.description ?? 'Unknown',
        smallThumbnail: character.volumeInfo.imageLinks?.smallThumbnail ??
            'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg',
        averageRating: character.volumeInfo.averageRating ?? 0.0,
        publishedDate: character.volumeInfo.publishedDate ?? '0000',
        authors: character.volumeInfo.authors?[0] ?? 'Unknown',
      ),
    );
    return characters.toList();
  }

  @override
  Future<BookCharacter> getOneCharacterInfo(String id) async {
    final response = await _bookApiClient.getOneCharacterInfo(id);
    final characters = BookCharacter(
      id: response.id,
      title: response.volumeInfo.title ?? 'Unknown',
      description: response.volumeInfo.description ?? 'Unknown',
      smallThumbnail: response.volumeInfo.imageLinks?.smallThumbnail ??
          'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg',
      averageRating: response.volumeInfo.averageRating ?? 0.0,
      publishedDate: response.volumeInfo.publishedDate ?? '0000',
      authors: response.volumeInfo.authors?[0] ?? 'Unknown',
    );
    return characters;
  }
}
