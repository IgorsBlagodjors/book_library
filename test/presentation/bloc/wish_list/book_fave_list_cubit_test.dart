import 'package:bloc_test/bloc_test.dart';
import 'package:book_library/presentation/wishlist/bloc/book_wish_list_cubit.dart';
import 'package:book_library/presentation/wishlist/bloc/book_wish_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'fake_fave_repository.dart';

void main() {
  late BookWishListCubit cubit;
  late FakeWishListRepository fakeBookRepository;

  setUp(() {
    fakeBookRepository = FakeWishListRepository();
    cubit = BookWishListCubit(fakeBookRepository);
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
      act: (cubit) => cubit.loadWishlist(),
      expect: () => [
        const BookWishListState(
          items: [],
          isLoading: true,
          isError: false,
        ),
        BookWishListState(
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
