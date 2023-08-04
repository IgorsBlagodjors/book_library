
import 'package:book_library/data/wishlist/model/wish_list_body.dart';
import 'package:book_library/data/wishlist/model/wish_list_response.dart';
import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:book_library/domain/items/wishlist.model/wish_list_book_class.dart';
import 'package:dio/dio.dart';

class WishListApiClient {
  final Dio _dio;

  WishListApiClient(this._dio);

  Future<String> addBookToWishList(BookClass item) async {
    final body = WishListBody(
      name: item.title,
      data: WishListDataBody(
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

  Future<List<WishListResponse>> getFaveItems(List<String> faveIds) async {
    if (faveIds.isEmpty) return [];
    final ids = faveIds.skip(1).fold('id=${faveIds.first}',
        (previousValue, value) => '$previousValue&id=$value');
    final response = await _dio.get('objects?$ids');
    final items = response.data as List<dynamic>;
    final faves = items.map((item) => WishListResponse.fromJson(item));
    return faves.toList();
  }

  Future<void> removeFromFaves(String favesId) async {
    await _dio.delete('objects/$favesId');
  }
  Future<String> undo(WishListBookClass item) async {
    final body = WishListBody(
      name: item.name,
      data: WishListDataBody(
        id: item.id,
        name: item.name,
        imageUrl: item.imageUrl,
        date: item.date,
        pageCount: item.pages,
        rating: item.rating,
        authors: item.authors,
      ),
    );
    final response = await _dio.post('objects', data: body.toJson());
    return response.data['id'];
  }
}
