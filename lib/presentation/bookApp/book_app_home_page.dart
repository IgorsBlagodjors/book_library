import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/presentation/bookApp/bloc/book_app_home_page_cubit.dart';
import 'package:book_library/presentation/bookApp/bloc/book_app_home_page_state.dart';
import 'package:book_library/presentation/widgets/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookAppHomePage extends StatefulWidget {
  const BookAppHomePage({Key? key}) : super(key: key);

  @override
  State<BookAppHomePage> createState() => _BookAppHomePageState();

  static Widget withCubit() => BlocProvider(
        create: (context) => BookAppHomePageCubit(
          context.read(),
        ),
        child: const BookAppHomePage(),
      );
}

class _BookAppHomePageState extends State<BookAppHomePage> {
  late final BookAppHomePageCubit _cubit;
  String? _queryFromLiveSearch;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.loadBooks(_queryFromLiveSearch);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppHomePageCubit, BookAppHomePageState>(
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
          child = ListView.separated(
            itemBuilder: (context, index) {
              final item = data[index];
              return BookDetailsView(items: item);
            },
            itemCount: data.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 16,
              );
            },
          );
        }
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 32),
                  TextFormField(
                    onFieldSubmitted: (query) {
                      _cubit.loadBooks(query);
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: AppLocalizations.of(context)!.searchBar,
                      hintStyle: const TextStyle(
                        color: AppColors.baseOnPrimaryLight,
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 48,
                        top: 19.5,
                        bottom: 19.5,
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          top: 19,
                          bottom: 19,
                        ),
                        child: AppIcons.search,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.onBackgroundLight),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.bookSearchText,
                        style: AppTypography.headline1Bold.copyWith(
                          color: AppColors.baseOnPrimaryLight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
