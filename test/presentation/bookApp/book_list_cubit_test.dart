import 'package:bloc_test/bloc_test.dart';
import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:book_library/presentation/bookApp/bloc/book_app_home_page_cubit.dart';
import 'package:book_library/presentation/bookApp/bloc/book_app_home_page_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'fake_book_repository.dart';

void main() {
  late BookAppHomePageCubit cubit;
  late FakeBookRepository fakeBookRepository;

  setUp(() {
    fakeBookRepository = FakeBookRepository();
    cubit = BookAppHomePageCubit(fakeBookRepository);
  });

  group('List of items tests', () {
    blocTest(
      'is empty when cubit is created',
      build: () => cubit,
      verify: (cubit) {
        expect(cubit.state.items, isEmpty);
        expect(cubit.state.isError, false);
        expect(cubit.state.isLoading, false);
      },
    );

    group('List of items tests', () {
      blocTest(
        'is not empty when loadItems is called',
        build: () => cubit,
        verify: (cubit) {
          expect(cubit.state.items, isEmpty);
          expect(cubit.state.isError, false);
          expect(cubit.state.isLoading, false);
        },
      );
    });
  });
  group('getAllBooksTest', () {
    blocTest(
      'getAllBooksTest',
      build: () => cubit,
      act: (cubit) => cubit.loadBooks(null),
      expect: () => [
        const BookAppHomePageState(
          items: [],
          isLoading: true,
          isError: false,
        ),
        const BookAppHomePageState(
          items: [
            BookClass(
              id: '1',
              title: 'Eagles feather',
              description: 'description',
              smallThumbnail: 'zzz',
              averageRating: 3.1,
              publishedDate: '2014',
              authors: 'Unknown',
              pageCount: 124,
              ratingsCount: 4,
            ),
          ],
          isLoading: false,
          isError: false,
        ),
      ],
    );
  });
  blocTest(
    'search',
    build: () => cubit,
    act: (cubit) async {
      const query = 'Witcher';
      await cubit.loadBooks(query);
    },
    expect: () => [
      const BookAppHomePageState(
        items: [],
        isLoading: true,
        isError: false,
      ),
      const BookAppHomePageState(
        items: [
          BookClass(
            id: '14',
            title: 'Witcher',
            description: 'description',
            smallThumbnail: 'yyyz',
            averageRating: 4.5,
            publishedDate: '2020',
            authors: 'Unknown',
            pageCount: 200,
            ratingsCount: 10,
          ),
        ],
        isLoading: false,
        isError: false,
      ),
    ],
  );
}
