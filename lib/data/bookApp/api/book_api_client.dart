import 'package:book_library/data/bookApp/models/book_response.dart';
import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:dio/dio.dart';

class BookApiClient {
  final Dio _dio;

  BookApiClient(this._dio);

  Future<List<BookClass>> getAllBooksInfo({String query = 'potter'}) async {
    final queryParam = {
      'q': query
    };
    final response = await _dio.get('volumes', queryParameters: queryParam);
    final fullResponse = BookFullResponse.fromJson(response.data);
    return fullResponse.toModel();
  }
  Future<BookClass> getOneCharacterInfo(String id) async {
    final response = await _dio.get('volumes/$id');
    final fullResponse = BookDataResponse.fromJson(response.data);
    return fullResponse.toModel();
  }
}
