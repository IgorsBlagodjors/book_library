import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/presentation/widgets/book_details_card_view.dart';
import 'package:book_library/presentation/wishlist/bloc/book_wish_list_cubit.dart';
import 'package:book_library/presentation/wishlist/bloc/book_wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookWishListPage extends StatefulWidget {
  const BookWishListPage({super.key});

  @override
  State<BookWishListPage> createState() => _BookWishListPageState();

  static Widget withCubit() => BlocProvider(
        create: (context) => BookWishListCubit(
          context.read(),
        ),
        child: const BookWishListPage(),
      );
}

class _BookWishListPageState extends State<BookWishListPage> {
  late final BookWishListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.loadWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookWishListCubit, BookWishListState>(
      builder: (context, state) {
        Widget? child;
        if (state.isLoading) {
          child = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          child = const Center(
            child: Text('Failure error'),
          );
        } else if (state.items.isEmpty) {
          child = Center(
            child: Text(
              'Your wish list is empty',
              style: AppTypography.subtitle1Bold.copyWith(
                color: AppColors.baseOnPrimaryLight,
              ),
            ),
          );
        } else {
          final data = state.items;
          child = ListView.builder(
            itemBuilder: (_, index) => Dismissible(
              key: ValueKey(data[index]),
              onDismissed: (_) {
                _cubit.removeFromWishlist(data[index].faveId);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 5),
                    action: SnackBarAction(
                      label: AppLocalizations.of(context)!.undo,
                      onPressed: () {
                        _cubit.undo(data[index]);
                      },
                    ),
                    content: Text('${data[index].name}  ${AppLocalizations.of(context)!.deleted}' ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 328 / 184,
                        child: Image.network(
                          data[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    data[index].name,
                    style: AppTypography.headline1Bold.copyWith(
                        color: AppColors.baseOnPrimaryLight,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context)!.stories,
                    style: AppTypography.subtitle1Bold.copyWith(
                      color: AppColors.baseOnPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data[index].authors,
                    style: AppTypography.body2Regular.copyWith(
                      color: AppColors.basePrimary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BookDetailsCardView(
                          title: AppLocalizations.of(context)!.released,
                          value: data[index].date.substring(0, 4),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        flex: 1,
                        child: BookDetailsCardView(
                          title: AppLocalizations.of(context)!.pages,
                          value: data[index].pages.toString(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        flex: 1,
                        child: BookDetailsCardView(
                          title: AppLocalizations.of(context)!.rating,
                          value: data[index].rating.toInt().toString(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            itemCount: data.length,
          );
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 44),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.wishList,
                    style: AppTypography.headline2Bold.copyWith(
                      color: AppColors.baseOnPrimaryLight,
                    ),
                  ),
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
