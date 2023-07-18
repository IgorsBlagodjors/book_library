import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/add_to_fave_list_button.dart';
import 'package:book_library/domain/items/model/book_details_number_item.dart';
import 'package:book_library/presentation/chars/bloc/book_home2_list_cubit.dart';
import 'package:book_library/presentation/chars/bloc/book_home2_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookHome2 extends StatefulWidget {
  final String passedId;

  const BookHome2({super.key, required this.passedId});

  @override
  State<BookHome2> createState() => _BookHome2State();

  Widget withCubit() => BlocProvider(
        create: (context) => BookHome2ListCubit(
          context.read(),
        ),
        child: BookHome2(passedId: passedId),
      );
}

class _BookHome2State extends State<BookHome2> {
  late final BookHome2ListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.getOneBook(widget.passedId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookHome2ListCubit, BookHome2ListState>(
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
          child = Column(
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
                  const SizedBox(width: 87),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.bookDetails,
                        style: AppTypography.headline2Bold.copyWith(
                          color: AppColors.baseOnPrimaryLight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 17),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 328 / 184,
                  child: Image.network(
                    data!.smallThumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                data.title,
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
                data.authors,
                style: AppTypography.body2Regular.copyWith(
                  color: AppColors.basePrimary,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  BookDetailsNumberItem(
                    title: AppLocalizations.of(context)!.released,
                    value: data.publishedDate.substring(0, 4),
                  ),
                  const SizedBox(width: 4),
                  BookDetailsNumberItem(
                    title: AppLocalizations.of(context)!.pages,
                    value: data.pageCount.toString(),
                  ),
                  const SizedBox(width: 4),
                  BookDetailsNumberItem(
                    title: AppLocalizations.of(context)!.rating,
                    value: data.averageRating.toString(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(AppLocalizations.of(context)!.description,
                  style: AppTypography.headline2Bold
                      .copyWith(color: AppColors.baseOnPrimaryLight)),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    Text(data.description,
                        style: AppTypography.body2Regular
                            .copyWith(color: AppColors.baseOnPrimaryLight)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AddToFaveListButton(
                    onPressed: () => {
                      _cubit.addToWishList(data),
                    },
                  ),
                ),
              ),
            ],
          );
        }
        return Scaffold(
          backgroundColor: AppColors.light,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
        );
      },
    );
  }
}
