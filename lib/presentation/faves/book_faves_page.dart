import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/domain/items/model/book_details_number_item.dart';
import 'package:book_library/presentation/faves/book_fave_list_cubit.dart';
import 'package:book_library/presentation/faves/book_fave_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookFavesPage extends StatefulWidget {
  const BookFavesPage({super.key});

  @override
  State<BookFavesPage> createState() => _BookFavesPageState();

  static Widget withCubit() => BlocProvider(
        create: (context) => BookFaveListCubit(
          context.read(),
        ),
        child: const BookFavesPage(),
      );
}

class _BookFavesPageState extends State<BookFavesPage> {
  late final BookFaveListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.loadItem();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookFaveListCubit, BookFaveListState>(
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
        } else {
          final data = state.items;
          child = ListView.builder(
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                _cubit.removeFromFaves(data[index].faveId);
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
                      BookDetailsNumberItem(
                        title: AppLocalizations.of(context)!.released,
                        value: data[index].date.substring(0, 4),
                      ),
                      const SizedBox(width: 4),
                      BookDetailsNumberItem(
                        title: AppLocalizations.of(context)!.pages,
                        value: data[index].pages.toString(),
                      ),
                      const SizedBox(width: 4),
                      BookDetailsNumberItem(
                        title: AppLocalizations.of(context)!.rating,
                        value: data[index].rating.toInt().toString(),
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
          backgroundColor: AppColors.light,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 44),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: AppIcons.back),
                    Expanded(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.wishList,
                          style: AppTypography.headline2Bold.copyWith(
                            color: AppColors.baseOnPrimaryLight,
                          ),
                        ),
                      ),
                    ),
                  ],
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
