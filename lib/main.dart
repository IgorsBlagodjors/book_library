import 'package:book_library/book_llist_page.dart';
import 'package:book_library/design_system/book_api_client.dart';
import 'package:book_library/design_system/book_repository.dart';
import 'package:book_library/design_system/books_list_page.dart';
import 'package:book_library/design_system/books_repository.dart';
import 'package:book_library/design_system/in_memory_books_repository.dart';
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
  final bookApiClient = BookApiClient(dio);
  final networkBookRepository = NetworkBookRepository(bookApiClient);
  final bookRepositoryProvider = RepositoryProvider<BookRepository>(
    create: (context) => networkBookRepository,
  );
  final booksRepository = InMemoryBooksRepository();
  final booksRepositoryProvider = RepositoryProvider<BooksRepository>(
    create: (context) => booksRepository,
  );
  runApp(
    MultiRepositoryProvider(
      providers: [
        booksRepositoryProvider,
        bookRepositoryProvider
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BookListPage(),
      ),
    ),
  );
}
