import 'package:book_library/data/faves/model/fave_book_body.dart';
import 'package:book_library/data/faves/model/fave_book_response.dart';
import 'package:book_library/domain/items/model/book_item_class.dart';
import 'package:dio/dio.dart';

class FaveApiClient {
  final Dio _dio;

  FaveApiClient(this._dio);

  Future<String> addBookToWishList(BookItem item) async {
    final body = FaveBookBody(
      name: item.title,
      data: FaveBookDataBody(
        id: item.id,
        name: item.title,
        imageUrl: item.smallThumbnail,
        date: item.publishedDate,
        pageCount: item.pageCount,
        rating: item.averageRating,
        authors: item.authors,
      ),
    );
    final response = await _dio.post('objects', data: body.toJson());
    return response.data['id'];
  }

  Future<List<FaveBookResponse>> getFaveItems(List<String> faveIds) async {
    if (faveIds.isEmpty) return [];
    final ids = faveIds.skip(1).fold('id=${faveIds.first}',
        (previousValue, value) => '$previousValue&id=$value');
    final response = await _dio.get('objects?$ids');
    final items = response.data as List<dynamic>;
    final faves = items.map((item) => FaveBookResponse.fromJson(item));
    return faves.toList();
  }

  Future<void> removeFromFaves(String favesId) async {
    await _dio.delete('objects/$favesId');
  }
}
