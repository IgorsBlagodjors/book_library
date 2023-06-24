import 'package:book_library/book_llist_page.dart';
import 'package:book_library/design_system/books_repository.dart';
import 'package:book_library/design_system/in_memory_books_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final booksRepository = InMemoryBooksRepository();
  final booksRepositoryProvider = RepositoryProvider<BooksRepository>(
    create: (context) => booksRepository,
  );
  runApp(
    MultiRepositoryProvider(
      providers: [
        booksRepositoryProvider,
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BookListPage(),
      ),
    ),
  );
}
