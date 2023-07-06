import 'package:bloc_test/bloc_test.dart';
import 'package:book_library/presentation/faves/book_fave_list_cubit.dart';
import 'package:book_library/presentation/faves/book_fave_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'fake_fave_repository.dart';

void main() {
  late BookFaveListCubit cubit;
  late FakeFaveRepository fakeBookRepository;

  setUp(() {
    fakeBookRepository = FakeFaveRepository();
    cubit = BookFaveListCubit(fakeBookRepository);
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
  group('getFaveItem', () {
    blocTest(
      'getFaveItem',
      build: () => cubit,
      act: (cubit) => cubit.loadItem(),
      expect: () => [
        const BookFaveListState(
          items: [],
          isLoading: true,
          isError: false,
        ),
        BookFaveListState(
          items: [
            faveItem[0],
            faveItem[1],
          ],
          isLoading: false,
          isError: false,
        ),
      ],
    );
  });
}
