import 'package:book_library/design_system/book_response.dart';
import 'package:dio/dio.dart';

class BookApiClient {
  final Dio _dio;
  BookApiClient(this._dio);

  Future<List<BookDataResponse>> getAllCharacters() async {
    final response = await _dio.get('volumes?q=potter');
    final fullResponse = BookFullResponse.fromJson(response.data);
    return fullResponse.items;
  }
  Future<List<BookDataResponse>> search(String query) async {
    final response = await _dio.get('volumes?q=$query');
    final fullResponse = BookFullResponse.fromJson(response.data);
    return fullResponse.items;
  }
  Future<BookDataResponse> getOneCharacterInfo(String id) async{
    final response = await _dio.get('volumes/$id');
    final fullResponse = SingleBookResponse.fromJson(response.data);
    return fullResponse.data;
  }
}