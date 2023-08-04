import 'package:book_library/data/bookApp/api/book_api_client.dart';
import 'package:book_library/data/bookApp/repository/network_book_repository.dart';
import 'package:book_library/data/wishlist/api/wish_list_api_client.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/domain/items/repository/book_repository.dart';
import 'package:book_library/presentation/widgets/bottom_navigation_bar.dart';
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

  final wishlistApiClient = WishListApiClient(favesDio);
  final bookApiClient = BookApiClient(dio);
  final networkBookRepository =
      NetworkBookRepository(bookApiClient, wishlistApiClient);
  final bookRepositoryProvider = RepositoryProvider<BookRepository>(
    create: (context) => networkBookRepository,
  );
  runApp(
    MultiRepositoryProvider(
      providers: [bookRepositoryProvider],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.light,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.light,
            elevation: 4,
            selectedItemColor: AppColors.basePrimary,
            unselectedItemColor: AppColors.onBackgroundLight,
          ),
        ),
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
        home: const AppBottomNavigationBar(),
      ),
    ),
  );
}
