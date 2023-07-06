import 'package:book_library/data/items/api/book_api_client.dart';
import 'package:book_library/data/items/repository/network_book_repository.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/presentation/chars/book_llist_page.dart';
import 'package:book_library/data/faves/api/fave_api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        debugShowCheckedModeBanner: false,
        home: BookListPage.withCubit(),
      ),
    ),
  );
}
