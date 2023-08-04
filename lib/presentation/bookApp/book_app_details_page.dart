import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/presentation/bookApp/bloc/book_app_details_page_cubit.dart';
import 'package:book_library/presentation/bookApp/bloc/book_app_details_page_state.dart';
import 'package:book_library/presentation/widgets/add_to_wishlist_button.dart';
import 'package:book_library/presentation/widgets/book_details_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookAppDetailsPage extends StatefulWidget {
  final String passedId;

  const BookAppDetailsPage({super.key, required this.passedId});

  @override
  State<BookAppDetailsPage> createState() => _BookAppDetailsPageState();

  Widget withCubit() => BlocProvider(
        create: (context) => BookAppDetailsPageCubit(
          context.read(),
        ),
        child: BookAppDetailsPage(passedId: passedId),
      );
}

class _BookAppDetailsPageState extends State<BookAppDetailsPage> {
  late final BookAppDetailsPageCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.getOneBook(widget.passedId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppDetailsPageCubit, BookAppDetailsPageState>(
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
                  Expanded(
                    child: Center(
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
                  Expanded(
                    flex: 1,
                    child: BookDetailsCardView(
                      title: AppLocalizations.of(context)!.released,
                      value: data.publishedDate.substring(0, 4),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    flex: 1,
                    child: BookDetailsCardView(
                      title: AppLocalizations.of(context)!.pages,
                      value: data.pageCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    flex: 1,
                    child: BookDetailsCardView(
                      title: AppLocalizations.of(context)!.rating,
                      value: data.averageRating.toString(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(AppLocalizations.of(context)!.description,
                  style: AppTypography.headline2Bold
                      .copyWith(color: AppColors.baseOnPrimaryLight)),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Text(
                          data.description,
                          style: AppTypography.body2Regular
                              .copyWith(color: AppColors.baseOnPrimaryLight),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 16.0,
                      right: 0.0,
                      child: AddToFaveListButton(
                        onPressed: () => {
                          _cubit.addToWishList(data),
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
        );
      },
    );
  }
}
