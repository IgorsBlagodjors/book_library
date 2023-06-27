import 'package:book_library/design_system/book_character.dart';

abstract class BookRepository {
  Future<List<BookCharacter>> getAllCharacters();
  Future<List<BookCharacter>> search(String query);
  Future<BookCharacter> getOneCharacterInfo(String id);
}