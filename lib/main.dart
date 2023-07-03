import 'package:book_library/book_llist_page.dart';
import 'package:book_library/design_system/book_api_client.dart';
import 'package:book_library/design_system/book_repository.dart';
import 'package:book_library/design_system/fave_api_client.dart';
import 'package:book_library/design_system/network_book_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://www.googleapis.com/books/v1/'),
  );
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );
  final favesDio = Dio(
    BaseOptions(baseUrl: 'https://api.restful-api.dev/'),
  );
  favesDio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );

  final favesApiClient = FaveApiClient(favesDio);
  final bookApiClient = BookApiClient(dio);
  final networkBookRepository =
      NetworkBookRepository(bookApiClient, favesApiClient);
  final bookRepositoryProvider = RepositoryProvider<BookRepository>(
    create: (context) => networkBookRepository,
  );
  runApp(
    MultiRepositoryProvider(
      providers: [bookRepositoryProvider],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BookListPage(),
      ),
    ),
  );
}
