import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/presentation/chars/bloc/book_list_cubit.dart';
import 'package:book_library/presentation/chars/bloc/book_list_state.dart';
import 'package:book_library/presentation/faves/book_faves_page.dart';
import 'package:book_library/presentation/chars/book_details_page.dart';
import 'package:book_library/design_system/show_fave_list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();

  static Widget withCubit() => BlocProvider(
        create: (context) => BookListCubit(
          context.read(),
        ),
        child: const BookListPage(),
      );
}

class _BookListPageState extends State<BookListPage> {
  late final BookListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookListCubit, BookListState>(
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
              return BookDetailsPage(items: item);
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
          backgroundColor: AppColors.light,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 32),
                  TextFormField(
                    onFieldSubmitted: (query) {
                      setState(
                        () {
                          _cubit.search(query);
                        },
                      );
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Start book search...',
                      hintStyle: const TextStyle(
                        color: AppColors.baseOnPrimaryLight,
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 48.0,
                        top: 19.5,
                        right: 147.0,
                        bottom: 19.5,
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                          left: 15.0,
                          top: 18.97,
                          right: 0.0,
                          bottom: 19.03,
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
                        'Books Search',
                        style: AppTypography.headline1Bold.copyWith(
                          color: AppColors.baseOnPrimaryLight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ShowFaveListButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BookFavesPage.withCubit(),
                          ));
                        },
                      ),
                    ),
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
